
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
  String type = "User";
  String abc = "";
  Object coordinates = {"latitude": 12.993006, "longitude": 80.232651};
  bool onChange = false;
  List<String> typeUser = ['Cadet', 'User'];
  String selectedType = 'Cadet';
  void initializeLocationAndSave() async {
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
                const Color.fromARGB(1, 36, 107, 8).withOpacity(0.5),
                BlendMode.luminosity),
            child: Image.asset(
              "assets/image/flag2.jpeg",
              alignment: Alignment.center,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
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
                    //Colors.
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Image.asset(
                        "assets/image/logo_ncc.png",
                        width: 300,
                        height: 200,
                      ),
                    ),
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
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black.withOpacity(0.5)),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            30), // Adjust the left padding as needed
                                  ),
                                  //Spacer(),
                                  DropdownButton<String>(
                                    iconSize: 40,
                                    focusColor: Colors.grey,
                                    dropdownColor: Colors.blue,
                                    iconEnabledColor: Colors.lightBlue,
                                    iconDisabledColor: Colors.blueAccent,
                                    value: selectedType,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedType = newValue!;
                                        type = newValue;
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
                              decoration: InputDecoration(
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
                              ),
                              validator: (value) {
                                if (value?.isEmpty == true) {
                                  return "User name cannot be empty";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                abc = value;
                                email = value;
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
                      borderRadius: BorderRadius.circular(25),
                      color: const Color.fromARGB(255, 3, 51, 103),
                      child: InkWell(
                        onTap: () async => {
                          // await sendDataToApi(
                          //     email, password, "123456 0987654"),
                          Navigator.pushNamed(context, MyRoutes.homeRoutes,
                              arguments: email),
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
                    // add divider here
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

                    // const Divider(
                    //   color: Colors.white,
                    //   thickness: 3,
                    //   indent: 10,
                    //   endIndent: 10,
                    // ),
                    // RichText(
                    //     text: TextSpan(children: [
                    //   const TextSpan(
                    //       text: "New here?",
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 20,
                    //       )),
                    //   TextSpan(
                    //       text: "Sign Up",
                    //       style: const TextStyle(
                    //           color: Colors.blue,
                    //           fontSize: 20,
                    //           decoration: TextDecoration.underline),
                    //       recognizer: TapGestureRecognizer()
                    //         ..onTap = () {
                    //           Navigator.pushNamed(
                    //               context, MyRoutes.signupRoutes);
                    //         }),
                    // ]))
