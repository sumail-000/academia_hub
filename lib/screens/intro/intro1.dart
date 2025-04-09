import 'package:flutter/material.dart';
import 'intro2.dart'; // Import intro2.dart from same directory
import '../auth/login.dart'; // Updated import path for login.dart

class IntroductionScreen1 extends StatelessWidget {
  const IntroductionScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Get screen dimensions for responsive sizing
            final Size screenSize = MediaQuery.of(context).size;
            
            // Calculate sizes based on available height
            final double availableHeight = constraints.maxHeight;
            final double logoHeight = availableHeight * 0.15; // 15% of available height
            final double illustrationHeight = availableHeight * 0.35; // 35% of available height
            final double textHeight = availableHeight * 0.15; // 15% of available height
            final double buttonHeight = availableHeight * 0.25; // 25% of available height
            
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo at the top with dynamic height
                Container(
                  height: logoHeight,
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'assets/Logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Flexible space for illustration
                Flexible(
                  flex: 7, // Takes 7 parts of available space
                  child: Container(
                    height: illustrationHeight,
                    child: Image.asset(
                      'assets/screen2.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Text content with dynamic height
                Flexible(
                  flex: 3, // Takes 3 parts of available space
                  child: Container(
                    height: textHeight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Heading
                        const Text(
                          'Seamless Notes Sharing',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF125F9D),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Paragraph
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            'Easily share and access study materials, notes, and assignments. '
                                'Filter by university, department, and semester for quick retrieval.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF125F9D),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Buttons with dynamic height
                Flexible(
                  flex: 5, // Takes 5 parts of available space
                  child: Container(
                    height: buttonHeight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Next Button with Shadow Effect
                        SizedBox(
                          width: screenSize.width * 0.8,
                          height: 50,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF3D7FBA),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF125F9D).withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 6,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const IntroductionScreen2(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Next',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Skip Button with Shadow Effect
                        SizedBox(
                          width: screenSize.width * 0.8,
                          height: 50,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFF6F4F4),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                side: const BorderSide(color: Color(0xFFF5F5F5)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>LoginScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Skip',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color(0xFF125F9D),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}