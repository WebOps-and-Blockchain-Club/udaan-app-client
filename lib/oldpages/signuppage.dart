// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_udaantfr/pages/EventsPage.dart';
//import 'package:flutter_application_udaantfr/utils/MyRoutes.dart';
//import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:http/http.dart' as http;
import 'package:mapbox_turn_by_turn/oldpages/EventsPage.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
import 'package:mapbox_turn_by_turn/widgets/api.dart';

class signuppage extends StatefulWidget {
  const signuppage({Key? key}) : super(key: key);

  @override
  State<signuppage> createState() => _signuppageState();
}

class _signuppageState extends State<signuppage> {
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? _validateNotEmpty(String? value, String field) {
    if (value == null || value.isEmpty) {
      return "$field cannot be empty";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    } else if (value.length < 6) {
      return "Password should be at least 6 characters";
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number cannot be empty";
    } else if (value.length != 10) {
      return "Phone number should be exactly 10 digits";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 500,
            child: Image.asset(
              "assets/image/udaan_try1.jpg",
              width: double.infinity,
              fit: BoxFit.cover,
              height: 50,
            ),
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 20,
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 10, top: 6),
                        // child: CupertinoButton(
                        //   child: const Icon(
                        //     CupertinoIcons.chevron_back,
                        //     //fill: CircleAvatar._defaultRadius,
                        //     color: Colors.black,
                        //   ),
                        //   onPressed: () {
                        //     Navigator.pushNamed(context, MyRoutes.signinRoutes);
                        //   },
                        // ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, MyRoutes.signinRoutes);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                            padding: const EdgeInsets.all(
                                5.0), // Adjust padding as needed
                            child: const Icon(
                              CupertinoIcons.chevron_back,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ],
                ),
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                const Text("Create a free account",
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          Positioned(
            bottom: 500,
            top: 180,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: const Size(double.infinity, 100),
              painter: ParabolaPainter(),
            ),
          ),
          Positioned(
            top: 300,
            left: 20,
            right: 20,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    validator: (value) => _validateNotEmpty(value, "Name"),
                    decoration: const InputDecoration(
                      labelText: "Name",
                      prefixIcon: Icon(CupertinoIcons.person_fill),
                    ),
                  ),
                  TextFormField(
                    controller: _usernameController,
                    validator: (value) => _validateNotEmpty(value, "Username"),
                    decoration: const InputDecoration(
                      labelText: "Username",
                      prefixIcon: Icon(CupertinoIcons.person_fill),
                    ),
                  ),
                  TextFormField(
                    controller: _addressController,
                    validator: (value) => _validateNotEmpty(value, "Address"),
                    decoration: const InputDecoration(
                      labelText: "Address",
                      prefixIcon: Icon(CupertinoIcons.location_fill),
                    ),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    validator: _validatePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(CupertinoIcons.lock_fill),
                    ),
                  ),
                  TextFormField(
                    controller: _phoneController,
                    validator: _validatePhone,
                    decoration: const InputDecoration(
                      labelText: "Phone",
                      prefixIcon: Icon(CupertinoIcons.phone_fill),
                    ),
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: const <TextSpan>[
                        TextSpan(
                          text: "By creating an account you agree to our ",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        TextSpan(
                          text: "terms and conditions",
                          style: TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                        TextSpan(
                          text: " and ",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        TextSpan(
                          text: "privacy policy",
                          style: TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, MyRoutes.homeRoutes);
                      }
                    },
                    child: const Text("Register"),
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

class ParabolaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
