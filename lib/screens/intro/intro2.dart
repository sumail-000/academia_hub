import 'package:flutter/material.dart';
import 'package:academia_hub/screens/auth/login.dart';

class Intro2 extends StatelessWidget {
  const Intro2({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF125F9D),
                  Color(0xFF3D7FBA),
                ],
              ),
            ),
            child: OrientationBuilder(
              builder: (context, orientation) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Logo
                    SizedBox(
                      height: isLandscape ? size.height * 0.15 : size.height * 0.15,
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: size.width * 0.3,
                        height: size.width * 0.3,
                        fit: BoxFit.contain,
                      ),
                    ),

                    // Illustration
                    SizedBox(
                      height: isLandscape ? size.height * 0.4 : size.height * 0.35,
                      child: Image.asset(
                        'assets/images/intro2.png',
                        width: size.width * 0.8,
                        fit: BoxFit.contain,
                      ),
                    ),

                    // Text Content
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                        vertical: isLandscape ? size.height * 0.02 : size.height * 0.03,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Interactive Discussions & Live Chat',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isLandscape ? size.width * 0.03 : size.width * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: isLandscape ? size.height * 0.02 : size.height * 0.03),
                          Text(
                            'Engage in real-time discussions with classmates and teachers. Share ideas, ask questions, and collaborate on projects through our integrated chat system.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isLandscape ? size.width * 0.02 : size.width * 0.04,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                    // Buttons
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.1,
                        vertical: isLandscape ? size.height * 0.02 : size.height * 0.03,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            width: size.width * 0.8,
                            height: isLandscape ? size.height * 0.08 : size.height * 0.06,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 5,
                              ),
                              child: Text(
                                'Next',
                                style: TextStyle(
                                  color: const Color(0xFF3D7FBA),
                                  fontSize: isLandscape ? size.width * 0.02 : size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: isLandscape ? size.height * 0.02 : size.height * 0.02),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginScreen()),
                              );
                            },
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: isLandscape ? size.width * 0.02 : size.width * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}