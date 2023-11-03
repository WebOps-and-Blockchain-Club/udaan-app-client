// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_turn_by_turn/oldpages/EventsPage.dart';
import 'package:mapbox_turn_by_turn/oldpages/SOSpage.dart';
import 'package:mapbox_turn_by_turn/oldpages/askperson.dart';
import 'package:mapbox_turn_by_turn/oldpages/cancel_request.dart';
import 'package:mapbox_turn_by_turn/oldpages/homepage.dart';
import 'package:mapbox_turn_by_turn/oldpages/otppage.dart';
import 'package:mapbox_turn_by_turn/screens/profile_per.dart';
import 'package:mapbox_turn_by_turn/widgets/MyDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
import 'oldpages/signinpage.dart';
import 'oldpages/signuppage.dart';
import 'ui/splash.dart';
import 'package:mapbox_turn_by_turn/widgets/api.dart';

late SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  await dotenv.load(fileName: "assets/config/.env");
  runApp(const MyApp());
}

// Define your custom text styles here
TextTheme customTextTheme = TextTheme(
  bodyText1: TextStyle(
    fontFamily: 'Arial', // Replace 'Arial' with your desired system font
    color: Colors.indigo[300],
  ),
  // Add other text styles as needed
);

// Define your custom theme
ThemeData customTheme = ThemeData(
  primarySwatch: Colors.indigo,
  textTheme: customTextTheme,
  // Other theme properties
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'UDAAN NCC',
      debugShowCheckedModeBanner: false,
      //theme: customTheme, // Use the custom theme here
      home: const askperson(),
      routes: {
        MyRoutes.signinRoutes: (context) => const signinpage(),
        MyRoutes.signupRoutes: (context) => const signuppage(),
        MyRoutes.eventsRoutes: (context) => const EventsPage(),
        MyRoutes.homeRoutes: (context) => homepage(),
        MyRoutes.drawerRoute: (context) => const MyDrawer(),
        MyRoutes.sosRoute: (context) => const SOSpage(),
        MyRoutes.splashRoute: (context) => const Splash(),
        MyRoutes.cancelRoutes: (context) => TimeGiven(),
        MyRoutes.askthem: (context) => const askperson(),
        MyRoutes.otpRoute: (context) => OTPScreen(),
        MyRoutes.profileRoute: (context) => const Profile(),
        //MyRoutes.mapRoute: (context) => MyMapapi(),
      },
    );
  }
}
