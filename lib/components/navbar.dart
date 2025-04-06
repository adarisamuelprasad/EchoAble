import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF00C4CC),
      elevation: 4,
      title: Row(
        children: [
          Lottie.asset(
            'assets/animations/logo_animation.json',
            height: 30,
            repeat: false,
            onLoaded: (composition) {
              // Animation loaded callback
            },
          ),
          const SizedBox(width: 10),
          const Text('EchoAble', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        ],
      ),
      actions: [
        MediaQuery.of(context).size.width > 600
            ? Row(
          children: [
            _navItem(context, 'Home', '/'),
            _navItem(context, 'Recognition', '/recognition'),
            _navItem(context, 'Translation', '/translation'),
            _navItem(context, 'About', '/about'),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/get_started'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF00C4CC),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Get Started'),
            ),
            const SizedBox(width: 16),
          ],
        )
            : IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ],
    );
  }

  Widget _navItem(BuildContext context, String title, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, route),
        style: TextButton.styleFrom(
          foregroundColor: ModalRoute.of(context)?.settings.name == route ? Colors.white : Colors.white70,
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF00C4CC), Color(0xFF00A3B1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(),
              child: Column(
                children: [
                  Lottie.asset(
                    'assets/animations/logo_animation.json',
                    height: 50,
                    repeat: false,
                  ),
                  const SizedBox(height: 10),
                  const Text('EchoAble', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () => Navigator.pushNamed(context, '/'),
            ),
            ListTile(
              leading: const Icon(Icons.gesture, color: Colors.white),
              title: const Text('Recognition', style: TextStyle(color: Colors.white)),
              onTap: () => Navigator.pushNamed(context, '/recognition'),
            ),
            ListTile(
              leading: const Icon(Icons.translate, color: Colors.white),
              title: const Text('Translation', style: TextStyle(color: Colors.white)),
              onTap: () => Navigator.pushNamed(context, '/translation'),
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.white),
              title: const Text('About', style: TextStyle(color: Colors.white)),
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
            ListTile(
              leading: const Icon(Icons.play_arrow, color: Colors.white),
              title: const Text('Get Started', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushNamed(context, '/get_started');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}