import 'package:coffee_shop_app/constants/colors.dart';
import 'package:coffee_shop_app/widgets/regular_text.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOnboardBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              './assets/images/onboarding.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 24,
                  ),
                  child: Text(
                    'Fall in Love with Coffee in Blissful Delight!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: RegularText(
                    text:
                        'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                    color: kGreyColor,
                    tAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 30,
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kBrownColor,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const RegularText(
                      text: 'Get Started',
                      size: 16,
                      color: Colors.white,
                      isBold: true,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
