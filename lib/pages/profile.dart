import 'package:flutter/material.dart';
import '../components/navbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = 'User Name';
  String _preferredLanguage = 'American Sign Language (ASL)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      drawer: const MobileDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 64, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFF0080FF),
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              const SizedBox(height: 16),
              Text(
                _name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _name = 'New User Name';
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0080FF)),
                child: const Text('Edit Profile', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: const Icon(Icons.language, color: Color(0xFF0080FF)),
                  title: const Text('Preferred Sign Language'),
                  subtitle: Text(_preferredLanguage),
                  trailing: const Icon(Icons.edit),
                  onTap: () {
                    setState(() {
                      _preferredLanguage = 'British Sign Language (BSL)';
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: SwitchListTile(
                  title: const Text('Dark Mode'),
                  value: false,
                  onChanged: (value) {
                    setState(() {
                      // Toggle theme (implement theme switching logic here)
                    });
                  },
                  secondary: const Icon(Icons.dark_mode, color: Color(0xFF0080FF)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}