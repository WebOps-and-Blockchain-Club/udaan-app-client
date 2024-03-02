// import 'dart:html';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';

import '../helpers/mapbox_handler.dart';
import '../main.dart';
import '../widgets/api.dart';

class AcceptDecline extends StatefulWidget {
  const AcceptDecline({super.key});

  @override
  State<AcceptDecline> createState() => _AcceptDeclineState();
}

class _AcceptDeclineState extends State<AcceptDecline> {
  late RemoteMessage message;
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
  }

  @override
  Widget build(BuildContext context) {
    message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/image/Events1.jpg'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Central Box
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "${message.notification?.title}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),

              // Accept and Decline Boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      initializeLocationAndSave();
                      print('Accept Request');
                      Navigator.pushNamed(context, MyRoutes.mapRoute,arguments:message.data);
                    },
                    child: Container(
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Accept',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Decline Request');
                      Navigator.pop(context, MyRoutes.homeRoutes);
                      // Handle decline action
                    },
                    child: Container(
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'Decline',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}