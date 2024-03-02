import 'package:flutter/material.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';

class askperson extends StatelessWidget {
  const askperson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(
                  "assets/image/WhatsApp Image 2023-11-03 at 9.53.36 PM.jpeg",
                ),
              ),
            ),
            Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, MyRoutes.signupRoutes);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: screenWidth*0.6,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Colors.lightGreen, // Change the color to your desired border color
                          width: 2, // Adjust the width of the border
                        ),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      //navigate
                      Navigator.pushNamed(context, MyRoutes.signinRoutes);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: screenWidth*0.6,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ]
            ),
          ],
        ),
      ),
    );
  }
}
