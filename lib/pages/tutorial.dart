import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../components/navbar.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({super.key});

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/tutorial1.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      drawer: const MobileDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 64, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign Language Tutorials',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
              ),
              const SizedBox(height: 16),
              const Text(
                'Learn the basics of sign language with our guided tutorials',
                style: TextStyle(fontSize: 18, color: Color(0xFF4A5568)),
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    _controller.value.isInitialized
                        ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller), // Correct usage of VideoPlayer with controller
                    )
                        : const Center(child: CircularProgressIndicator(color: Color(0xFF0080FF))),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Tutorial 1: Basic Alphabet',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Learn the A-Z signs with step-by-step guidance',
                            style: TextStyle(fontSize: 16, color: Color(0xFF4A5568)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.play_arrow, color: Color(0xFF0080FF)),
                title: const Text('Tutorial 2: Common Phrases'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.play_arrow, color: Color(0xFF0080FF)),
                title: const Text('Tutorial 3: Numbers 1-10'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}