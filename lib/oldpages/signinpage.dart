
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
import 'package:mapbox_turn_by_turn/widgets/api.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import '../helpers/mapbox_handler.dart';
import '../main.dart';

class signinpage extends StatefulWidget {
  const signinpage({Key? key}) : super(key: key);

  @override
  State<signinpage> createState() => _signinpageState();
}

class _signinpageState extends State<signinpage> {
  String email = "";
  String password = "";
  String type = "Cadet";
  String abc = "";
  Object coordinates = {"latitude": 12.993006, "longitude": 80.232651};
  bool onChange = false;
  List<String> typeUser = ['Cadet', 'User'];
  String selectedType = 'Cadet';

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

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Image with curved edges
            Container(
              height: totalHeight * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/image/login_new_1.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    const Color.fromARGB(1, 36, 107, 8).withOpacity(0.5),
                    BlendMode.luminosity,
                  ),
                ),
              ),
            ),
            // White background below the image
            Container(
              margin: EdgeInsets.only(top: totalHeight * 0.35),
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.white,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,  // Align the content to the start
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      // Login text
                      const Text(
                        "Login",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Type dropdown
                      Text(
                        "Email Address",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
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
                          prefixIconColor: Colors.blueAccent,
                          prefixIcon: Transform.scale(
                            scale: 1.5,
                            child: const Icon(CupertinoIcons.person_fill),
                          ),
                          // labelText: "Email",
                          labelStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          // fillColor: const Color.fromRGBO(0, 0, 0, 0.5),
                          // filled: true,
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
                      const SizedBox(height: 20),
                      // Password text field
                      Text(
                        "Password",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
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
                          prefixIconColor: Colors.blue,
                          prefixIcon: Transform.scale(
                            scale: 1.5,
                            child: const Icon(CupertinoIcons.lock_shield_fill),
                          ),
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
                      const SizedBox(height: 20),
                      Container(
                        height: 50,
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
                                left: 10,
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
                                iconEnabledColor: Colors.lightBlue,
                                iconDisabledColor: Colors.blueAccent,
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
                                            fontSize: 20,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      );
                                    }).toList(),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 100, left: 30),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),
                      // Forgot Password
                      InkWell(
                        onTap: () {
                          // Forgot Password logic here
                        },
                        child: Text(
                          "Forgot Password?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Login button
                      Padding(
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        child: Material(
                          borderRadius: BorderRadius.circular(25),
                          // color: const Color.fromARGB(255, 3, 51, 103),
                          color: Colors.blue,
                          child: InkWell(
                            onTap: () async {
                              // await sendDataToApi(
                              //   email,
                              //   password,
                              //   "123456 0987654",
                              // );
                              Navigator.pushNamed(
                                context,
                                MyRoutes.homeRoutes,
                                arguments: email,
                              );
                            },
                            child: AnimatedContainer(
                              width: onChange ? 50 : 200,
                              height: 50,
                              duration: const Duration(seconds: 1),
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
                      const SizedBox(height: 20),
                      // Don't have an account? Create one.
                      InkWell(
                        onTap: () {
                          // Create account logic here
                          Navigator.pushNamed(context, MyRoutes.signupRoutes);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(color: Colors.black),
                              textScaleFactor: 1.2,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "Create one",
                              textScaleFactor: 1.2,
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
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