import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mapbox_turn_by_turn/oldpages/otppage.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import '../helpers/mapbox_handler.dart';
import '../main.dart';
import '../widgets/api.dart';
import 'package:bcrypt/bcrypt.dart';

class signinpage extends StatefulWidget {
  const signinpage({Key? key}) : super(key: key);

  @override
  State<signinpage> createState() => _signinpageState();
}

String email = "abc";

class _signinpageState extends State<signinpage> {
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
  // String latitude="12.993006";
  String longitude = "80.232651";
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
  void initState() {
    super.initState();
    initializeLocationAndSave();
  }

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
// latitude=_locationData.latitude;
    coordinates = currentLocation;
    // Get the current user address
    String currentAddress =
    (await getParsedReverseGeocoding(currentLocation))['place'];
    postDataToApiAddress(currentLocation,
        currentAddress); //    --------------->>>>>>>>>>>>>>>    //uncomment thiss for passing lat lng
    // currentAddress = jsonEncode(currentAddress);

    // Store the user location in sharedPreferences
    sharedPreferences.setDouble('latitude', _locationData.latitude!);
    sharedPreferences.setDouble('longitude', _locationData.longitude!);
    sharedPreferences.setString('current-address', currentAddress);
    //await Duration(seconds: 30);
    // Navigator.pushAndRemoveUntil(
    //     context, ////////comment this one
    //     MaterialPageRoute(builder: (_) => const Home()),
    //     (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 0,
              right: 20,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 15, top: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, MyRoutes.askthem);
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                              padding: const EdgeInsets.all(
                                  5.0),
                              child: const Icon(
                                CupertinoIcons.chevron_back,
                                color: Colors.white,
                              ),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Image.asset(
                      "assets/image/WhatsApp Image 2023-11-03 at 9.53.36 PM.jpeg",
                      width: 800,
                      height: 200,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
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
                        GestureDetector(
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            child: TextFormField(
                              controller: _passwordController,
                              validator: _validatePassword,
                              onChanged: (value) {
                                password = value;
                                password = BCrypt.hashpw(password, BCrypt.gensalt());
                              },
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: "Password",
                                prefixIcon: Icon(CupertinoIcons.lock_fill),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () async {
                          // await sendDataToApi1(email);
                          print("ho gaya");
                          // if (_formKey.currentState!.validate()) {
                            print("true");
                            Navigator.pushNamed(context,MyRoutes.homeRoutes);
                            // Navigator.pushAndRemoveUntil(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => OTPScreen(
                            //         email: email,
                            //         username: name,
                            //         password: password,
                            //         coordinates: coordinates,
                            //         state: state,
                            //         role: role,
                            //         isAvailable: true,
                            //         city: city,
                            //         fcmToken:
                            //         "cmAVfV4HTsyDr-Yh6-0-WU:APA91bFdUUMlt30VLlYuCNksQOXezZrLocdw4ag4qP89ZyyEyxNQTA0jKTsJbO_ogVTC64vBNeH6QMXoEK4JdJUpM1rjuIV4tJsPfSAIoJr_CBUjFI4lbUo0bvIU_kpmsaiODZZ_YxfC", //add the fcmtoken here
                            //       )),
                            //       (Route<dynamic> route) => false,
                            // );
                          // } else {
                          //   print("false");
                          //   Navigator.pushNamed(context, MyRoutes.signinRoutes);
                          // }
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
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
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
