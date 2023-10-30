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
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
import 'package:mapbox_turn_by_turn/ui/splash.dart';

class SOSpage extends StatefulWidget {
  const SOSpage({Key? key}) : super(key: key);

  @override
  State<SOSpage> createState() => _SOSpageState();
}

class _SOSpageState extends State<SOSpage> {
  int _secondsRemaining = 5;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
        // Navigate to the homepage when the timer is done.
        Navigator.pushReplacementNamed(context, MyRoutes.splashRoute);
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
            color: Colors.black,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: 160,
                      height: 160,
                      decoration: const BoxDecoration(
                        color: Colors.red, // Change background color to red
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '$_secondsRemaining',
                          style: const TextStyle(
                              fontSize: 34,
                              color:
                                  Colors.white), // Change text color to yellow
                        ),
                      ),
                    ),
                    // Positioned(
                    //   top: 0,
                    //   bottom: 0,
                    //   left: 0,
                    //   right: 0,
                    //   child: CircularProgressIndicator(
                    //     value: 1 - (_secondsRemaining / 5),
                    //     valueColor: const AlwaysStoppedAnimation<Color>(
                    //         Colors.amberAccent),
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: LinearProgressIndicator(
                    value: 1 - (_secondsRemaining / 5),
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.amberAccent),
                  ),
                ),
                const SizedBox(
                  height: 180,
                ),
                Container(
                  height: 80,
                  width: 180,
                  child: ElevatedButton(
                    onPressed: () {
                      // Cancel the request and navigate to the homepage.
                      Navigator.pushReplacementNamed(
                          context, MyRoutes.homeRoutes);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
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
