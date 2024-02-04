import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    _storing();
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
            color: const Color.fromARGB(231, 9, 3, 37),
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Stack(
                  alignment: Alignment.center,
                  children: <Widget>[],
                ),
                const SizedBox(height: 80),
                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                ),
                const CircularProgressIndicator(),
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
