import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../components/navbar.dart';
import '../components/button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

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
                'assets/animations/get_started_animation.json',
                height: 200,
                repeat: true,
              ),
              const Text('Get Started with EchoAble', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF1A202C))),
              const SizedBox(height: 16),
              const Text('Choose the plan that’s right for you and start breaking communication barriers today.',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Color(0xFF4A5568))),
              const SizedBox(height: 24),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  _pricingCard(
                    context,
                    'Free Trial',
                    'Free',
                    'Perfect for individuals who want to explore the technology.',
                    ['Basic sign language recognition', 'Text to sign translation (limited)', 'Web access only', '10 translations per day'],
                    'Start Free Trial',
                    false,
                  ),
                  _pricingCard(
                    context,
                    'Personal',
                    '\$9.99',
                    'Ideal for regular users who need reliable translations.',
                    ['Advanced sign recognition', 'Unlimited translations', 'Mobile app access', 'Multiple sign languages', 'Offline mode'],
                    'Choose Personal',
                    true,
                  ),
                  _pricingCard(
                    context,
                    'Enterprise',
                    '\$29.99',
                    'For businesses and organizations requiring professional features.',
                    ['All Personal features', 'API access', 'Custom vocabulary', 'Team management', 'Priority support', 'Advanced analytics'],
                    'Contact Sales',
                    false,
                  ),
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
                    const Text('Stay Updated', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1A202C))),
                    const SizedBox(height: 8),
                    const Text('Join our newsletter to get the latest updates on our technology and features.',
                        textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Color(0xFF4A5568))),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Your email address',
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        CustomButton(
                          text: 'Subscribe',
                          icon: Icons.arrow_forward,
                          onPressed: () {},
                        ),
                      ],
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

  Widget _pricingCard(BuildContext context, String title, String price, String description, List<String> features, String buttonText, bool isPopular) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 300,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isPopular ? [Color(0xFFE0F7FA), Color(0xFFB2EBF2)] : [Colors.white, Color(0xFFF0F4F8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isPopular ? const Color(0xFF00C4CC) : const Color(0xFFF8F9FA)),
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
          if (isPopular)
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color(0xFF00C4CC),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              ),
              child: const Center(child: Text('Most Popular', style: TextStyle(color: Colors.white))),
            ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1A202C))),
                const SizedBox(height: 8),
                Text(price, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF1A202C))),
                const SizedBox(height: 8),
                Text(description, style: const TextStyle(fontSize: 14, color: Color(0xFF4A5568))),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: features.map((feature) => Row(
                    children: [
                      const Icon(Icons.check, color: Color(0xFF00C4CC), size: 18),
                      const SizedBox(width: 8),
                      Expanded(child: Text(feature, style: const TextStyle(fontSize: 14, color: Color(0xFF4A5568)))),
                    ],
                  )).toList(),
                ),
                const SizedBox(height: 16),
                CustomButton(
                  text: buttonText,
                  variant: isPopular ? 'primary' : 'secondary',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}