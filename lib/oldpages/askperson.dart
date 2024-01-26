import 'package:flutter/material.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';

class askperson extends StatefulWidget {
  const askperson({super.key});

  @override
  State<askperson> createState() => _askpersonState();
}

class _askpersonState extends State<askperson> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      // left: 0,
      // right: 0,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/image/WhatsApp Image 2023-11-03 at 9.53.36 PM.jpeg",
                  ),
                  fit: BoxFit.contain
                  // fit: BoxFit.fill
                  )),
          child: Center(
            child: Positioned(
              top: 100,
              left: 0,
              // right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 380,
                    //width: 450,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, MyRoutes.signupRoutes);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 200,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        //border: CircleBorder( )
                        //border: Colors.accents,
                        border: Border.all(
                          color: Colors
                              .blue, // Change the color to your desired border color
                          width: 2, // Adjust the width of the border
                        ),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black.withOpacity(
                        //         0.3), // Change the shadow color and opacity
                        //     spreadRadius: 2, // Spread radius
                        //     blurRadius: 4, // Blur radius
                        //     offset: Offset(0, 3), // Shadow offset
                        //   ),
                        // ],
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      //navigate
                      Navigator.pushNamed(context, MyRoutes.signinRoutes);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 200,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 8, 93, 220),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
