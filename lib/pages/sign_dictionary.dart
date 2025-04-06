import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../components/navbar.dart';

class SignDictionaryPage extends StatelessWidget {
  const SignDictionaryPage({super.key});

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
                'Sign Language Dictionary',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
              ),
              const SizedBox(height: 16),
              const Text(
                'Search and learn common signs',
                style: TextStyle(fontSize: 18, color: Color(0xFF4A5568)),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search signs...',
                  prefixIcon: const Icon(Icons.search, color: Color(0xFF0080FF)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (value) {},
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: Lottie.asset('assets/animations/hello_animation.json', height: 50, repeat: false),
                  title: const Text('Hello'),
                  subtitle: const Text('Greeting sign'),
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: Lottie.asset('assets/animations/thankyou_animation.json', height: 50, repeat: false),
                  title: const Text('Thank You'),
                  subtitle: const Text('Gratitude sign'),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}