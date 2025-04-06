import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../components/navbar.dart';
import '../components/button.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      drawer: const MobileDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 64, 16, 32),
          child: Column(
            children: [
              const Text('Our Mission at EchoAble', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF1A202C))),
              const SizedBox(height: 16),
              Lottie.asset(
                'assets/animations/mission_animation.json',
                height: 200,
                repeat: true,
              ),
              const Text('We’re dedicated to breaking communication barriers between deaf and hearing communities through innovative AI technology.',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Color(0xFF4A5568))),
              const SizedBox(height: 24),
              const Text('Our Story', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1A202C))),
              const SizedBox(height: 8),
              const Text('EchoAble was founded with a simple yet powerful vision: to create a world where everyone can communicate freely, regardless of hearing ability.',
                  style: TextStyle(fontSize: 16, color: Color(0xFF4A5568))),
              const SizedBox(height: 16),
              const Text('What started as a research project has evolved into a comprehensive platform that serves thousands of users worldwide.',
                  style: TextStyle(fontSize: 16, color: Color(0xFF4A5568))),
              const SizedBox(height: 24),
              const Text('Our Technology', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1A202C))),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _featureCard('Advanced AI', Icons.psychology, 'Our proprietary machine learning models have been trained on millions of sign language examples.'),
                  _featureCard('Powerful API', Icons.code, 'Developers can integrate our translation capabilities into their own applications.'),
                ],
              ),
              const SizedBox(height: 24),
              const Text('Our Values', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1A202C))),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _featureCard('Inclusivity', Icons.group, 'We believe in creating technology that works for everyone.'),
                  _featureCard('Excellence', Icons.star, 'We’re committed to continuous improvement and maintaining the highest standards.'),
                ],
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
                child: Column(
                  children: [
                    const Text('Join Us in Our Mission', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1A202C))),
                    const SizedBox(height: 8),
                    const Text('Experience how EchoAble is transforming communication for deaf and hearing communities worldwide.',
                        textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Color(0xFF4A5568))),
                    const SizedBox(height: 16),
                    CustomButton(
                      text: 'Get Started Today',
                      onPressed: () => Navigator.pushNamed(context, '/get_started'),
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

  Widget _featureCard(String title, IconData icon, String description) {
    return Container(
      width: 300,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(color: Color(0xFFE6F4FF), shape: BoxShape.circle),
            child: Icon(icon, color: const Color(0xFF00C4CC), size: 24),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A202C))),
          const SizedBox(height: 8),
          Text(description, style: const TextStyle(fontSize: 14, color: Color(0xFF4A5568))),
        ],
      ),
    );
  }
}