// // ignore_for_file: unused_import

// import 'package:flutter/material.dart';
// import 'package:mapbox_turn_by_turn/ui/splash.dart';
// //import 'package:flutter_application_udaantfr/pages/mapdisplay.dart';
// //import 'package:flutter_application_udaantfr/utils/MyRoutes.dart';
// import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
// import 'package:mapbox_turn_by_turn/widgets/api.dart';

// class SOSpage extends StatefulWidget {
//   const SOSpage({Key? key}) : super(key: key);

//   @override
//   State<SOSpage> createState() => _SOSpageState();
// }

// class _SOSpageState extends State<SOSpage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: Container(
//         height: 70,
//         width: 200,
//         decoration: BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: GestureDetector(
//           onTap: () {
//             // Navigator.pushNamed(context, MyRoutes.mapRoute);
//             Navigator.pushNamed(context, MyRoutes.splashRoute);
//           },
//           child: const Text("Emergency",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 40,
//               )),
//         ),
//       ),
//     ));
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
//import 'package:mapbox_turn_by_turn/ui/splash.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../helpers/mapbox_handler.dart';
import '../main.dart';
//import '../screens/home.dart';
import '../widgets/api.dart';
//import 'package:mapbox_turn_by_turn/ui/splash.dart';

class SOSpage extends StatefulWidget {
  const SOSpage({Key? key}) : super(key: key);

  @override
  State<SOSpage> createState() => _SOSpageState();
}

class _SOSpageState extends State<SOSpage> {
  int _secondsRemaining = 14;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
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

    // Get the current user address
    String currentAddress =
        (await getParsedReverseGeocoding(currentLocation))['place'];
    postDataToApiAddress(currentLocation,
        currentAddress); //    --------------->>>>>>>>>>>>>>>    //uncomment thiss for passing lat lng
    //currentAddress = jsonEncode(currentAddress);

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

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
        // Navigate to the homepage when the timer is done.
        Navigator.pushNamed(context, MyRoutes.splashRoute);
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Color.fromARGB(231, 9, 3, 37),
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    // AnimatedContainer(
                    //   duration: const Duration(seconds: 1),
                    //   width: 110,
                    //   height: 110,
                    //   decoration: const BoxDecoration(
                    //     color: Colors.black, // Change background color to red
                    //     shape: BoxShape.circle,
                    //   ),
                    //   child: Center(
                    //     child: Text(
                    //       '$_secondsRemaining',
                    //       style: const TextStyle(
                    //           fontSize: 34,
                    //           color:
                    //               Colors.white), // Change text color to yellow
                    //     ),
                    //   ),
                    // ),
                    // Positioned(
                    //   top: 0,
                    //   bottom: 0,
                    //   left: 0,
                    //   right: 0,
                    //   child: CircularProgressIndicator(
                    //     value: 1 - (_secondsRemaining / 30),
                    //     valueColor: const AlwaysStoppedAnimation<Color>(
                    //         Colors.amberAccent),
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(height: 80),
                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  // child: LinearProgressIndicator(
                  //   value: 1 - (_secondsRemaining / 30),
                  //   valueColor: const AlwaysStoppedAnimation<Color>(
                  //       Colors.lightGreenAccent),
                  // ),
                ),
                // const SizedBox(
                //   height: 120,
                // ),
                const CircularProgressIndicator(
                    // value: 1 - (_secondsRemaining / 30),
                    // valueColor:
                    //     const AlwaysStoppedAnimation<Color>(Colors.amberAccent),
                    ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    "    Loading...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
                AnimatedContainer(
                  duration: const Duration(
                    seconds: 30,
                  ),
                  height: 80,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ElevatedButton(
                    //   decoration: const BoxDecoration(
                    //   borderRadius: BorderRadius.all(Radius.circular(40)),
                    // ),

                    onPressed: () {
                      // Cancel the request and navigate to the homepage.
                      Navigator.pushReplacementNamed(
                          context, MyRoutes.homeRoutes);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        )

                        //foregroundColor: Colors.black,
                        ),

                    child: const Text(
                      'Cancel Request',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
