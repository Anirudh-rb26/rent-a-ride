import 'package:flutter/material.dart';
import 'package:rentaride/presentation/screens/car_list_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: const Color(0xff2C2B34),
      body: Column(
        children: [
          // CoverImage
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/onboarding.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Premium Cars. \nExtreme Comfort.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Gap
                  const SizedBox(height: 10),

                  const Text(
                    "Premium Rrental Cars in Prestige Condition. \nfor Daily Use & Long Trips. \nexpereince Luxury at a Lower Price.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),

                  // Gap
                  const SizedBox(height: 10),

                  SizedBox(
                    width: 320,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => const CarListScreen()),
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        r"Let's Go",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
