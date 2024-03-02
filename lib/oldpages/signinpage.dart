// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
import 'package:mapbox_turn_by_turn/widgets/api.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import '../helpers/mapbox_handler.dart';
import '../main.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'google_language_fonts.dart';

class signinpage extends StatefulWidget {
  const signinpage({Key? key}) : super(key: key);

  @override
  State<signinpage> createState() => _signinpageState();
}

class _signinpageState extends State<signinpage> {
  String email = "";
  String password = "";
  String type = "Select";
  String abc = "";
  Object coordinates = {"latitude": 12.993006, "longitude": 80.232651};
  bool onChange = false;
  List<String> typeUser = ['Select Role', 'Cadet', 'User'];
  String selectedType = 'Select Role';

  bool isobsecrue = true;

  final _formKey = GlobalKey<FormState>();

  void initializeLocationAndSave() async {
    // ... (existing code remains the same)

    // Ensure all permissions are collected for Locations
    Location _location = Location();
    bool? _serviceEnabled;
    PermissionStatus? _permissionGranted;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
    }

    // Get the current user location
    LocationData _locationData = await _location.getLocation();
    LatLng currentLocation =
    LatLng(_locationData.latitude!, _locationData.longitude!);

    // Get the current user address
    String currentAddress =
    (await getParsedReverseGeocoding(currentLocation))['place'];
    postDataToApiAddress(currentLocation,
        currentAddress); //    --------------->>>>>>>>>>>>>>>    //uncomment thiss for passing lat lng
    //currentAddress = jsonEncode(currentAddress);
    coordinates = currentLocation;

    // Store the user location in sharedPreferences
    sharedPreferences.setDouble('latitude', _locationData.latitude!);
    sharedPreferences.setDouble('longitude', _locationData.longitude!);
    sharedPreferences.setString('current-address', currentAddress);
  }

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
    double totalHeight = MediaQuery.of(context).size.height;
    double totalWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Image with curved edges
            Container(
              height: totalHeight * 0.33,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/image/imgUdaan3.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    const Color.fromARGB(1, 36, 107, 8).withOpacity(0.0),
                    BlendMode.luminosity,
                  ),
                ),
              ),
            ),
            // White background below the image
            Container(
              height: totalHeight*0.64,
              margin: EdgeInsets.only(top: totalHeight * 0.33),
              padding: EdgeInsets.symmetric(horizontal: 25),
              color: Colors.white,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,  // Align the content to the start
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: totalHeight*0.01),
                      // Login text
                      const Text(
                        "Login",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 34,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: totalHeight*0.03),
                      // Type dropdown
                      Text(
                        "Email Address",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.gothicA1(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                          ),
                        ),
                      ),

                      // const SizedBox(height: 10),
                      // Email text field
                      TextFormField(

                        cursorColor: Colors.black,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: "Email Address",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        validator: (value) {
                          if (value?.isEmpty == true) {
                            return "Email cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          abc = value;
                          email = value;
                          setState(() {
                            abc = value;
                          });
                        },
                      ),
                      SizedBox(height: totalHeight*0.03),
                      // Password text field
                      Text(
                        "Password",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.gothicA1(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      TextFormField(
                        obscureText: isobsecrue,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          // prefixIconColor: Colors.lightGreen,
                          // prefixIcon: Transform.scale(
                          //   scale: 1.3,
                          //   child: const Icon(CupertinoIcons.lock_shield_fill),
                          // ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isobsecrue
                                  ? CupertinoIcons.eye_slash
                              // ignore: dead_code
                                  : CupertinoIcons.eye,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              // Toggle password visibility logic here
                              isobsecrue = !(isobsecrue);
                              setState(() {});
                            },
                          ),
                          // labelText: "Password",
                          labelStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          // fillColor: const Color.fromRGBO(0, 0, 0, 0.5),
                          // filled: true,
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
                      SizedBox(height: totalHeight*0.03),
                      Text(
                        "Role",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.gothicA1(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        height: totalHeight*0.05,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          // color: Colors.black.withOpacity(0.5),
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                left: 0,
                              ),
                            ),
                            Expanded(
                              child: DropdownButton<String>(
                                iconSize: 40,
                                isDense: true,
                                isExpanded: true,
                                // isExpanded: true,
                                // padding: EdgeInsets.only(right: 30),

                                focusColor: Colors.grey,
                                dropdownColor: Colors.white,
                                iconEnabledColor: Colors.lightGreen,
                                iconDisabledColor: Colors.lightGreen,
                                value: selectedType,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedType = newValue!;
                                    type = newValue;
                                  });
                                },
                                items: typeUser.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w300,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      );
                                    }).toList(),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 0, left: 0),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: totalHeight*0.02),
                      // Forgot Password
                      InkWell(
                        onTap: () {
                          // Forgot Password logic here
                        },
                        child: Text(
                          "Forgot Password?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            // color: Colors.black,
                            color: Color.fromRGBO(121, 121, 121, 1),
                            fontSize: 16,
                            // decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(height: totalHeight*0.02),
                      // Login button
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          // color: const Color.fromARGB(255, 3, 51, 103),
                          // color: Colors.lightGreen,
                          color: Color.fromRGBO(89, 158, 133, 1),
                          child: InkWell(
                            onTap: () async {
                              await sendDataToApi(
                                email,
                                password,
                                "123456 0987654",
                              );
                              Navigator.pushNamed(
                                context,
                                MyRoutes.homeRoutes,
                                arguments: email,
                              );
                            },
                            child: AnimatedContainer(
                              width: onChange ? 150 : 220,
                              height: totalHeight*0.07,
                              duration: const Duration(seconds: 1),
                              // color: Colors.lightGreen,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(89, 158, 133, 1),
                              ),
                              alignment: Alignment.center,
                              child: onChange
                                  ? const Icon(
                                Icons.done,
                                color: Color.fromARGB(255, 21, 151, 202),
                              )
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
                      ),
                      SizedBox(height: totalHeight*0.015),
                      // Don't have an account? Create one.
                      InkWell(
                        onTap: () {
                          // Create account logic here
                          Navigator.pushNamed(context, MyRoutes.signupRoutes);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Text(
                            //   "Don't have an account?",
                            //   style: TextStyle(color: Colors.black),
                            //   textScaleFactor: 1.2,
                            // ),
                            Text(
                              "Don't have an account?",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.gothicA1(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  // fontWeight: FontWeight.w300,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "Create one",
                              textScaleFactor: 1.2,
                              style: TextStyle(
                                color: Color.fromRGBO(89, 158, 133, 1),
                                // decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}