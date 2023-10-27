// ignore_for_file: unused_import, unnecessary_import

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_udaantfr/utils/MyRoutes.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter_application_udaantfr/widgets/api.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
import 'package:mapbox_turn_by_turn/widgets/api.dart';

//import 'package:flutter/src/painting/border_radius.dart';

class signinpage extends StatefulWidget {
  const signinpage({Key? key}) : super(key: key);

  @override
  State<signinpage> createState() => _signinpageState();
}

class _signinpageState extends State<signinpage> {
  String username = "";
  String password = "";
  String abc = "";
  bool onChange = false;
  // Future<void> sendDataToApi(String username, String password) async {
  //   if (_formKey.currentState!.validate()) {
  //     setState(() {
  //       onChange = true;
  //     });

  //     // Send user data to the API
  //     try {
  //       await sendDataToApi(username, password);
  //       // API request successful
  //       await Navigator.pushNamed(context, MyRoutes.homeRoutes);
  //     } catch (e) {
  //       // Handle API request error
  //       // You can show an error message or perform other actions
  //     } finally {
  //       setState(() {
  //         onChange = false;
  //       });
  //     }
  //   }
  // }

  List<String> typeUser = ['Cadet', 'User'];
  String selectedType = 'User';

  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        onChange = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoutes);
      setState(() {
        onChange = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColorFiltered(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.darken),
            child: Image.asset(
              "assets/image/flag2.jpeg",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              //color: Color.fromARGB(186, 59, 59, 59),
              //colorBlendMode: BlendMode.luminosity,
            )),
        Material(
          color: Colors.transparent,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Image.asset(
                        "assets/image/logo_ncc.png",
                        width: 300,
                        height: 200,
                      ),
                    ),

                    // Text(
                    //   "WELCOME $abc",
                    //   style: const TextStyle(
                    //       color: Colors.black,
                    //       fontSize: 25,
                    //       height: 2,
                    //       fontWeight: FontWeight.w200),
                    // ),

                    const SizedBox(
                      height: 15,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              height: 50,

                              //width: 40,
                              //color: Color.fromARGB(126, 182, 132, 5),
                              width: double.infinity,

                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black.withOpacity(0.5)),
                              //width: 20,
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            30), // Adjust the left padding as needed
                                  ),
                                  //Spacer(),
                                  DropdownButton<String>(
                                    // itemHeight: 20,
                                    iconSize: 40,

                                    focusColor: Colors.grey,
                                    dropdownColor: Colors.blue,
                                    iconEnabledColor: Colors.lightBlue,
                                    iconDisabledColor: Colors.blueAccent,
                                    value: selectedType,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedType = newValue!;
                                      });
                                    },
                                    items: typeUser
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              cursorColor: Colors.black,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                //icon: Icon(CupertinoIcons.person_solid),
                                hintText: "User Name",

                                hintStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                                prefixIconColor: Colors.blueAccent,
                                prefixIcon: Transform.scale(
                                    scale: 1.5,
                                    child:
                                        const Icon(CupertinoIcons.person_fill)),

                                labelText: "username",
                                labelStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                                fillColor: const Color.fromRGBO(0, 0, 0, 0.5),
                                filled: true,
                                //border: Border.fromBorderSide(10),
                              ),
                              validator: (value) {
                                if (value?.isEmpty == true) {
                                  return "User name cannot be empty";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                abc = value;
                                username = value;
                                //build(context);

                                setState(() {
                                  abc = value;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              obscureText: true,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                hintText: "Enter Password",
                                hintStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                                prefixIconColor: Colors.blueAccent,
                                prefixIcon: Transform.scale(
                                    scale: 1.5,
                                    child: const Icon(
                                        CupertinoIcons.lock_shield_fill)),
                                //icon: Icon(CupertinoIcons.lock_fill),
                                labelText: "Password",
                                labelStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                                fillColor: const Color.fromRGBO(0, 0, 0, 0.5),
                                filled: true,
                              ),
                              onChanged: (value) => {password = value},
                              validator: (value) {
                                if (value?.isEmpty == true) {
                                  return "Password cannot be empty";
                                } else if (value!.length < 6) {
                                  return "Password length should be more than 6 letters";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(onChange ? 25 : 8),
                      color: const Color.fromARGB(255, 3, 51, 103),
                      child: InkWell(
                        onTap: () async => {
                          //await sendDataToApi(username, password),
                          Navigator.pushNamed(context, MyRoutes.homeRoutes)
                        },
                        child: AnimatedContainer(
                          width: onChange ? 50 : 150,
                          height: 50,
                          duration: const Duration(seconds: 1),
                          alignment: Alignment.center,
                          child: onChange
                              ? const Icon(Icons.done,
                                  color: Color.fromARGB(255, 21, 151, 202))
                              : const Text(
                                  "Sign in",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const InkWell(
                      // onTap: () => ,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 3,
                      indent: 10,
                      endIndent: 10,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      const TextSpan(
                          text: "New here?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          )),
                      TextSpan(
                          text: "Sign Up",
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                  context, MyRoutes.signupRoutes);
                            }),
                    ]))
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
