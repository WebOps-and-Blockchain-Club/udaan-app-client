import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';

class TimeGiven extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.lightBlue,
      home: TimerScreen(),
    );
  }
}

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _secondsRemaining = 30;
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
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_secondsRemaining seconds',
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.homeRoutes);
              },
              child: const Text('Cancel Request'),
            ),
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// //import 'package:flutter_startup/home_page.dart';
// import 'package:mapbox_turn_by_turn/oldpages/homepage.dart';

// class TimeGiven extends StatefulWidget {
//   const TimeGiven({Key? key}) : super(key: key);

//   @override
//   State<TimeGiven> createState() => _TimeGivenState();
// }

// //765EFC
// class _TimeGivenState extends State<TimeGiven> {
//   @override
//   void initState() {
//     super.initState();
//     goToHome();
//   }

//   void goToHome() async {
//     await Future.delayed(const Duration(seconds: 2), () {
//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (context) => homepage()),
//         (Route<dynamic> route) => false,
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         alignment: Alignment.center,
//         color: const Color(0xFF765EFC),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset(
//               "assets/image/person.jpg",
//               width: 48,
//             ),
//             Container(
//               margin: const EdgeInsets.only(top: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const SizedBox(
//                     child: CircularProgressIndicator(
//                       color: Colors.green,
//                       backgroundColor: Colors.amberAccent,
//                       strokeWidth: 2.0,
//                     ),
//                     width: 24,
//                     height: 24,
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(left: 10),
//                     child: const Text(
//                       'Loading...',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
