import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:camera/camera.dart';
import '../components/navbar.dart';
import '../components/button.dart';

class RecognitionPage extends StatefulWidget {
  const RecognitionPage({super.key});

  @override
  _RecognitionPageState createState() => _RecognitionPageState();
}

class _RecognitionPageState extends State<RecognitionPage> {
  bool _isProcessing = false;
  bool _isListening = false;
  bool _isInVideoCall = false;
  CameraController? _cameraController;
  String _recognizedGesture = 'Ready to detect signs';
  String _speechText = 'Press mic to speak';

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    _cameraController = CameraController(
      cameras[0],
      ResolutionPreset.medium,
    );
    await _cameraController!.initialize();
    if (mounted) setState(() {});
  }

  void _startRecognition() {
    setState(() {
      _isProcessing = true;
      _recognizedGesture = 'Detecting signs... (Prototype)';
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isProcessing = false;
        _recognizedGesture = 'Detected: "Hello" (Prototype result)';
      });
    });
  }

  void _listen() {
    setState(() {
      _isListening = true;
      _speechText = 'Listening... (Prototype)';
    });
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isListening = false;
        _speechText = 'You said: "How are you?" (Prototype)';
        _recognizedGesture = 'Converting to sign... (Prototype)';
      });
    });
  }

  void _startVideoCall() {
    setState(() => _isInVideoCall = true);
  }

  void _endVideoCall() {
    setState(() => _isInVideoCall = false);
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cameraRatio = screenWidth / (screenWidth * 16 / 9);

    return Scaffold(
      appBar: const Navbar(),
      drawer: const MobileDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 64, 16, 32),
          child: Column(
            children: [
              const Text('Communication Hub',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF1A202C))),
              const SizedBox(height: 16),
              Lottie.asset(
                'assets/animations/communication_animation.json',
                height: 150,
                repeat: true,
              ),
              const Text(
                'Experience real-time sign language communication',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Color(0xFF4A5568)),
              ),
              const SizedBox(height: 24),

              // Sign to Speech Prototype
              _buildFeatureCard(
                'Sign to Speech',
                'Translate sign language gestures to text/speech in real-time',
                _buildCameraPreview(cameraRatio),
                [
                  CustomButton(
                    text: _isProcessing ? 'Processing...' : 'Try Sign Detection',
                    icon: Icons.gesture,
                    onPressed: _startRecognition,
                    disabled: _isProcessing,
                    isLoading: _isProcessing,
                  ),
                  CustomButton(
                    text: 'Learn More',
                    variant: 'secondary',
                    icon: Icons.info,
                    onPressed: () {},
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Speech to Sign Prototype
              _buildFeatureCard(
                'Speech to Sign',
                'Convert spoken words to sign language animations',
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFF8F9FA), Color(0xFFE6F4FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text(_speechText,
                          style: const TextStyle(fontSize: 16, color: Color(0xFF1A202C))),
                      const SizedBox(height: 16),
                      FloatingActionButton(
                        onPressed: _listen,
                        backgroundColor: const Color(0xFF00C4CC),
                        child: Icon(
                          _isListening ? Icons.mic_off : Icons.mic,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                [
                  CustomButton(
                    text: 'Show Animation',
                    variant: 'secondary',
                    icon: Icons.play_arrow,
                    onPressed: () {
                      setState(() {
                        _recognizedGesture = 'Playing sign animation for: "$_speechText" (Prototype)';
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Video Call Prototype
              _buildFeatureCard(
                'Video Call',
                'Connect with others in real-time with sign-to-speech and speech-to-sign',
                _isInVideoCall
                    ? Column(
                  children: [
                    AspectRatio(
                      aspectRatio: cameraRatio,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF00C4CC), width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Your Camera Feed (Placeholder)',
                            style: TextStyle(fontSize: 16, color: Color(0xFF4A5568)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    AspectRatio(
                      aspectRatio: cameraRatio,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF00C4CC), width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Partner Feed (Placeholder)',
                            style: TextStyle(fontSize: 16, color: Color(0xFF4A5568)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          text: 'Mute',
                          icon: Icons.mic_off,
                          variant: 'secondary',
                          onPressed: () {},
                        ),
                        const SizedBox(width: 16),
                        CustomButton(
                          text: 'End Call',
                          icon: Icons.call_end,
                          onPressed: _endVideoCall,
                        ),
                      ],
                    ),
                  ],
                )
                    : Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFF8F9FA), Color(0xFFE6F4FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.video_call, size: 60, color: Color(0xFF00C4CC)),
                      const SizedBox(height: 16),
                      const Text(
                        'Start a Video Call',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1A202C)),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Connect with deaf/mute users or hearing individuals in real-time.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Color(0xFF4A5568)),
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        text: 'Start Call',
                        icon: Icons.video_call,
                        onPressed: _startVideoCall,
                      ),
                    ],
                  ),
                ),
                [],
              ),

              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFE6F4FF), Color(0xFFD1E8FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.info, color: Color(0xFF00C4CC)),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        _recognizedGesture,
                        style: const TextStyle(fontSize: 16, color: Color(0xFF1A202C)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCameraPreview(double ratio) {
    return AspectRatio(
      aspectRatio: ratio,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF00C4CC), width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: _cameraController != null && _cameraController!.value.isInitialized
            ? ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CameraPreview(_cameraController!),
        )
            : const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Color(0xFF00C4CC)),
              SizedBox(height: 16),
              Text('Camera Loading...', style: TextStyle(color: Color(0xFF4A5568))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
      String title, String description, Widget content, List<Widget> buttons) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Color(0xFFF0F4F8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1A202C)),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Color(0xFF4A5568)),
          ),
          const SizedBox(height: 16),
          content,
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: buttons,
          ),
        ],
      ),
    );
  }
}