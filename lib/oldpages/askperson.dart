import 'package:flutter/material.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';

class askperson extends StatefulWidget {
  const askperson({Key? key}) : super(key: key);

  @override
  State<askperson> createState() => _askpersonState();
}

class _askpersonState extends State<askperson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image/udaan_try1.jpg"),
                fit: BoxFit.fill)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 350,
                //width: 450,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.signupRoutes);
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: 200,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
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
                  duration: Duration(milliseconds: 500),
                  width: 200,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 47, 220, 8),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
