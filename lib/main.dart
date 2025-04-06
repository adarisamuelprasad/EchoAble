import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'pages/index.dart';
import 'pages/not_found.dart';
import 'pages/recognition.dart';
import 'pages/translation.dart';
import 'pages/about.dart';
import 'pages/get_started.dart';
import 'pages/videocall.dart';
import 'pages/tutorial.dart';
import 'pages/profile.dart';
import 'pages/sign_dictionary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EchoAble',
      theme: ThemeData(
        primaryColor: const Color(0xFF0080FF),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Inter',
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
          bodyMedium: TextStyle(fontSize: 16, color: Color(0xFF4A5568)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF0080FF),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            elevation: 5,
            shadowColor: Colors.black26,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0080FF),
          elevation: 4,
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFF0080FF),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          elevation: 8,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/videocall': (context) => const VideoCallPage(),
        '/recognition': (context) => const RecognitionPage(),
        '/translation': (context) => const TranslationPage(),
        '/about': (context) => const AboutPage(),
        '/get_started': (context) => const GetStartedPage(),
        '/tutorial': (context) => const TutorialPage(),
        '/profile': (context) => const ProfilePage(),
        '/sign_dictionary': (context) => const SignDictionaryPage(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const NotFoundPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _controller;
  late Animation<double> _animation;

  static const List<Widget> _pages = <Widget>[
    IndexPage(),
    RecognitionPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _controller.forward(from: 0);
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _animation,
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gesture),
            label: 'Recognition',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}