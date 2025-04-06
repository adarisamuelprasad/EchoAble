import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../components/navbar.dart';
import '../components/button.dart';

class TranslationPage extends StatefulWidget {
  const TranslationPage({super.key});

  @override
  _TranslationPageState createState() => _TranslationPageState();
}

class _TranslationPageState extends State<TranslationPage> {
  final TextEditingController _controller = TextEditingController();
  bool _isTranslating = false;
  bool _showResult = false;
  String _selectedSignLanguage = 'American Sign Language (ASL)';
  String _selectedSpokenLanguage = 'English';

  final List<String> _signLanguages = [
    'American Sign Language (ASL)',
    'British Sign Language (BSL)',
    'Australian Sign Language (Auslan)',
    'French Sign Language (LSF)',
    'German Sign Language (DGS)',
    'Japanese Sign Language (JSL)',
    'Chinese Sign Language (CSL)',
    'Italian Sign Language (LIS)',
    'Spanish Sign Language (LSE)',
    'Brazilian Sign Language (Libras)',
    'Indian Sign Language (ISL)',
    'Russian Sign Language (RSL)',
    'Arabic Sign Language',
    'Korean Sign Language (KSL)',
    'Mexican Sign Language (LSM)',
    'South African Sign Language (SASL)',
    'New Zealand Sign Language (NZSL)',
    'Irish Sign Language (ISL)',
    'Swedish Sign Language (TSP)',
    'Dutch Sign Language (NGT)'
  ];

  final List<String> _spokenLanguages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Italian',
    'Portuguese',
    'Russian',
    'Japanese',
    'Chinese (Mandarin)',
    'Hindi',
    'Arabic',
    'Korean',
    'Turkish',
    'Dutch',
    'Swedish',
    'Polish',
    'Thai',
    'Vietnamese',
    'Greek',
    'Hebrew'
  ];

  void _translate() {
    if (_controller.text.trim().isEmpty) return;
    setState(() => _isTranslating = true);
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isTranslating = false;
        _showResult = true;
      });
    });
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
            children: [
              Lottie.asset(
                'assets/animations/translation_animation.json',
                height: 150,
                repeat: true,
              ),
              const Text('Text to Sign',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF1A202C))),
              const SizedBox(height: 16),
              const Text('Bridge the Communication Gap',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1A202C))),
              const SizedBox(height: 16),
              const Text(
                'Convert spoken or written language into sign language representations',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Color(0xFF4A5568)),
              ),
              const SizedBox(height: 24),

              Container(
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
                    const Text('Translation Settings',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A202C))),
                    const SizedBox(height: 16),

                    DropdownButtonFormField<String>(
                      value: _selectedSpokenLanguage,
                      items: _spokenLanguages.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: const TextStyle(color: Color(0xFF1A202C))),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() => _selectedSpokenLanguage = newValue!);
                      },
                      decoration: const InputDecoration(
                        labelText: 'Spoken Language',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: TextStyle(color: Color(0xFF4A5568)),
                      ),
                      dropdownColor: Colors.white,
                      icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF00C4CC)),
                      isExpanded: true,
                    ),
                    const SizedBox(height: 16),

                    DropdownButtonFormField<String>(
                      value: _selectedSignLanguage,
                      items: _signLanguages.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: const TextStyle(color: Color(0xFF1A202C))),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() => _selectedSignLanguage = newValue!);
                      },
                      decoration: const InputDecoration(
                        labelText: 'Sign Language',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: TextStyle(color: Color(0xFF4A5568)),
                      ),
                      dropdownColor: Colors.white,
                      icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF00C4CC)),
                      isExpanded: true,
                    ),
                    const SizedBox(height: 24),

                    const Text('Enter Your Text',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A202C))),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _controller,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Type or speak your message here...',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: 'Speak Input',
                            variant: 'secondary',
                            icon: Icons.mic,
                            onPressed: () {
                              setState(() {
                                _controller.text = 'Hello! How are you today? (Prototype speech input)';
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomButton(
                            text: _isTranslating ? 'Translating...' : 'Show Sign',
                            icon: Icons.translate,
                            onPressed: _translate,
                            disabled: _isTranslating || _controller.text.trim().isEmpty,
                            isLoading: _isTranslating,
                          ),
                        ),
                      ],
                    ),

                    if (_showResult) ...[
                      const SizedBox(height: 24),
                      Container(
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
                            const Text('Sign Language Output',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1A202C))),
                            const SizedBox(height: 16),
                            Container(
                              height: 250,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xFFF8F9FA), Color(0xFFE6F4FF)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Lottie.asset(
                                      'assets/animations/sign_animation.json',
                                      height: 150,
                                      repeat: true,
                                    ),
                                    const SizedBox(height: 16),
                                    Text('From: $_selectedSpokenLanguage',
                                        style: const TextStyle(fontSize: 14, color: Color(0xFF4A5568))),
                                    Text('To: $_selectedSignLanguage',
                                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1A202C))),
                                    const SizedBox(height: 8),
                                    Text('"${_controller.text}"',
                                        style: const TextStyle(fontStyle: FontStyle.italic, color: Color(0xFF4A5568))),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text('(Prototype: In full version, this would show accurate sign animations)',
                                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12, color: Color(0xFF718096))),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
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
                child: const Row(
                  children: [
                    Icon(Icons.info, color: Color(0xFF00C4CC)),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'This prototype demonstrates the translation flow. The full version would include accurate sign language animations for each language pair.',
                        style: TextStyle(fontSize: 14, color: Color(0xFF1A202C)),
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
}