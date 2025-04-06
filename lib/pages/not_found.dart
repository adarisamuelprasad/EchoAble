import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../components/navbar.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      drawer: const MobileDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade900, Colors.teal.shade600],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/animations/error_animation.json',
                height: 200,
                repeat: true,
              ),
              const SizedBox(height: 16),
              const Text('404', style: TextStyle(fontSize: 72, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 16),
              const Text('Page not found', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white70)),
              const SizedBox(height: 16),
              const Text('Sorry, we couldn’t find the page you’re looking for.',
                  style: TextStyle(fontSize: 18, color: Colors.white54), textAlign: TextAlign.center),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/'),
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                label: const Text('Back to Home', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00C4CC),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}