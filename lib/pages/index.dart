import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../components/navbar.dart';
import '../components/button.dart';
import '../pages/videocall.dart';
import '../pages/translation.dart';
import '../pages/about.dart';
import '../pages/tutorial.dart';
import '../pages/sign_dictionary.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      drawer: const MobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              padding: const EdgeInsets.fromLTRB(24, 80, 24, 60),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade900, Colors.blue.shade700],
                ),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo_white.png',
                    height: 60,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'EchoAble',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Empower Your Voice',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Connect effortlessly with the world using AI-powered sign language tools',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 200,
                    child: CustomButton(
                      text: 'Start Now',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),

            // Quick Navigation Section (Explore EchoAble)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
              child: Column(
                children: [
                  const Text(
                    'Explore EchoAble',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      _navCard(context, 'Home', Icons.home, '/'),
                      _navCard(context, 'Video Call', Icons.video_call, '/videocall'),
                      _navCard(context, 'Translation', Icons.translate, '/translation'),
                      _navCard(context, 'About', Icons.info, '/about'),
                      _navCard(context, 'Tutorials', Icons.school, '/tutorial'),
                      _navCard(context, 'Sign Dictionary', Icons.book, '/sign_dictionary'),
                    ],
                  ),
                ],
              ),
            ),

            // Testimonials Section
            Container(
              padding: const EdgeInsets.all(24),
              color: const Color(0xFFF8F9FA),
              child: Column(
                children: [
                  const Text(
                    'What Our Users Say',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      _testimonialCard('“EchoAble changed my life!” - Sarah', 'A deaf user who now communicates effortlessly with her family.'),
                      _testimonialCard('“Amazing technology!” - John', 'A teacher using EchoAble in his classroom.'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navCard(BuildContext context, String title, IconData icon, String route) {
    return SizedBox(
      width: 150,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => Navigator.pushNamed(context, route),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Icon(icon, size: 40, color: Colors.blue.shade700),
                const SizedBox(height: 15),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _testimonialCard(String quote, String author) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF8F9FA)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(quote, style: const TextStyle(fontSize: 16, color: Color(0xFF4A5568))),
          const SizedBox(height: 8),
          Text(author, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF333333))),
        ],
      ),
    );
  }
}