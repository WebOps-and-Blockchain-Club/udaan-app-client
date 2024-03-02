import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/mapbox_handler.dart';
import '../main.dart';
import '../widgets/api.dart';

class SOSpage extends StatefulWidget {
  const SOSpage({Key? key}) : super(key: key);

  @override
  State<SOSpage> createState() => _SOSpageState();
}

class _SOSpageState extends State<SOSpage> {
  int _secondsRemaining = 14;
  late Timer _timer;

  String token = "";
  Future<void> _storing() async {
    print("sos");
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      token = prefs.getString('token') ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
    initializeLocationAndSave();
    _storing();
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
        Navigator.pushNamed(context, MyRoutes.mapRoute);
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
      appBar: AppBar(
        title: Text('SOS Page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Add your profile icon action here
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Need emergency service?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.0),

            ElevatedButton(
              onPressed: () {
                // Add your SOS button action here

              },
              style: ElevatedButton.styleFrom(
                // primary: Color.fromRGBO(233, 99, 98, 1),
                backgroundColor: Color.fromRGBO(233, 99, 98, 1),
                padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 80.0),
              ),
              child:const Text(
                'SOS',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,

                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'or',
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Emergency call',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
