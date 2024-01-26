//import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_turn_by_turn/oldpages/otppage.dart';
//import 'package:http/http.dart' as http;
//import 'package:mapbox_turn_by_turn/oldpages/EventsPage.dart';
//import 'package:mapbox_turn_by_turn/oldpages/otppage.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// export 'var';
import 'package:mapbox_turn_by_turn/widgets/api.dart';

// void savedata(String key, String value) async {
//   final pref = await SharedPreferences.getInstance();
//   await pref.setString(key, value);
// }
class signuppage extends StatefulWidget {
  const signuppage({Key? key}) : super(key: key);

  @override
  State<signuppage> createState() => _signuppageState();
}

String email = "abc";

class _signuppageState extends State<signuppage> {
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  String name = "";
  //String username = "";
  String password = "";
  Object coordinates = {"latitude": 12.993006, "longitude": 80.232651};
  String state = "Punjab";
  String city = "Bhatinda";
  String role = "s";
  String phone = "";
  String address = "";

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
            top: 20,
            left: 0,
            right: 0,
            //bottom: 500,
            child: Container(
              // decoration: const BoxDecoration(
              //   borderRadius: BorderRadius.only(
              //       bottomLeft: Radius.circular(90),
              //       bottomRight: Radius.circular(90)),
              // ),
              child: Image.asset(
                "assets/image/WhatsApp Image 2023-11-03 at 9.53.36 PM.jpeg",
                width: 800,
                height: 200,
                //fit: BoxFit.fitHeight,
                //height: 190,
              ),
            ),
          ),
          // const Divider(
          //   color: Colors.white,
          //   thickness: 3,
          //   indent: 10,
          //   endIndent: 10,
          // ),

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
                // const Divider(
                //   color: Colors.black12,
                //   thickness: 2,
                //   indent: 10,
                //   endIndent: 10,
                // ),
                // const Text(
                //   "Sign Up",
                //   style: TextStyle(
                //     fontSize: 24,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.white,
                //   ),
                // ),
                // const SizedBox(height: 30),
                // const Text("Create a free account",
                //     style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          // const Divider(
          //   color: Colors.black12,
          //   thickness: 2,
          //   indent: 10,
          //   endIndent: 10,
          // ),
          const Positioned(
            bottom: 500,
            top: 180,
            left: 20,
            right: 20,
            child: CustomPaint(
              size: Size(double.infinity, 100),
              //painter: ParabolaPainter(),
            ),
          ),
          Positioned(
            top: 250,
            left: 20,
            right: 20,
            //bottom: 0,

            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Divider(
                    color: Colors.black12,
                    thickness: 2,
                    indent: 10,
                    endIndent: 10,
                  ),
                  TextFormField(
                    controller: _nameController,
                    validator: (value) => _validateNotEmpty(value, "Name"),
                    onChanged: (value) {
                      name = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "Name",
                      prefixIcon: Icon(CupertinoIcons.person_fill),
                    ),
                  ),
                  TextFormField(
                    controller: _usernameController,
                    validator: (value) => _validateNotEmpty(value, "Email"),
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(CupertinoIcons.mail_solid),
                    ),
                  ),
                  TextFormField(
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    controller: _addressController,
                    validator: (value) => _validateNotEmpty(value, "Address"),
                    onChanged: (value) {
                      address = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "Address",
                      prefixIcon: Icon(CupertinoIcons.location_fill),
                      //fillColor: Color.fromRGBO(0, 0, 0, 0.5),
                      //filled: true,
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12))),
                    ),
                  ),
                  GestureDetector(
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      child: TextFormField(
                        controller: _passwordController,
                        validator: _validatePassword,
                        onChanged: (value) {
                          password = value;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(CupertinoIcons.lock_fill),
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _phoneController,
                    validator: _validatePhone,
                    onChanged: (value) {
                      phone = value;
                    },
                    decoration: const InputDecoration(
                      labelText: "Phone",
                      prefixIcon: Icon(CupertinoIcons.phone_fill),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // RichText(
                  //   text: TextSpan(
                  //     style: DefaultTextStyle.of(context).style,
                  //     children: const [
                  //       TextSpan(
                  //         text: "By creating an account you agree to our ",
                  //         style: TextStyle(color: Colors.black, fontSize: 12),
                  //       ),
                  //       TextSpan(
                  //         text: "terms and conditions",
                  //         style: TextStyle(
                  //             color: Colors.blue,
                  //             fontSize: 12,
                  //             decoration: TextDecoration.underline),
                  //       ),
                  //       TextSpan(
                  //         text: " and ",
                  //         style: TextStyle(color: Colors.black, fontSize: 12),
                  //       ),
                  //       TextSpan(
                  //         text: "privacy policy",
                  //         style: TextStyle(
                  //             color: Colors.blue,
                  //             fontSize: 12,
                  //             decoration: TextDecoration.underline),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const Column(
                    children: [
                      Text(
                        "By creating an account you agree to our ",
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "terms and conditions",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          Text(
                            " and ",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          Text(
                            "privacy policy",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),
                  // AnimatedContainer(
                  //   duration: const Duration(milliseconds: 1000),
                  //   width: 400,
                  //   height: 50,
                  //   alignment: Alignment.center,
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       if (_formKey.currentState!.validate()) {
                  //         Navigator.pushNamed(context, MyRoutes.homeRoutes);
                  //       }
                  //     },
                  //     child: const Text("Register"),
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () async {
                      await sendDataToApi1(name, password, email, coordinates,
                          state, city, role, address);
                      print("ho gaya");
                      if (_formKey.currentState!.validate()) {
                        print("true");
                        // Navigator.pushNamed(context, MyRoutes.otpRoute,
                        //     arguments: email);
                        // Navigator.pushNamed(context, MyRoutes.homeRoutes);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OTPScreen(
                                    email: email,
                                  )),
                          (Route<dynamic> route) => false,
                        );
                      } else {
                        print("false");
                        Navigator.pushNamed(context, MyRoutes.signinRoutes);
                      }
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: 200,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 3, 51, 103),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Text(
                        'Sign Up',
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
