// ignore_for_file: unused_import

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_turn_by_turn/api/firebase_api.dart';
import 'package:mapbox_turn_by_turn/oldpages/EventsPage.dart';
import 'package:mapbox_turn_by_turn/oldpages/SOSpage.dart';
import 'package:mapbox_turn_by_turn/oldpages/accept_decline.dart';
import 'package:mapbox_turn_by_turn/oldpages/askperson.dart';
import 'package:mapbox_turn_by_turn/oldpages/cancel_request.dart';
import 'package:mapbox_turn_by_turn/oldpages/homepage.dart';
import 'package:mapbox_turn_by_turn/oldpages/otppage.dart';
import 'package:mapbox_turn_by_turn/screens/prepare_ride.dart';
import 'package:mapbox_turn_by_turn/screens/profile_per.dart';
import 'package:mapbox_turn_by_turn/widgets/MyDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
import 'package:mapbox_turn_by_turn/oldpages/eventDetails.dart';
import 'oldpages/signinpage.dart';
import 'oldpages/signuppage.dart';
import 'ui/splash.dart';
import 'package:mapbox_turn_by_turn/widgets/api.dart';

// firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

late SharedPreferences sharedPreferences;
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background Message : ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///////////////////////////////////
  // FIREBASE MESSAGING
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final notificationSettings =
      await FirebaseMessaging.instance.requestPermission(provisional: true);
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print("fcmToken is ${fcmToken} ");
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FirebaseMessaging.instance.setAutoInitEnabled(true);

  ////////////////////////////////////////
  sharedPreferences = await SharedPreferences.getInstance();
  await dotenv.load(fileName: "assets/config/.env");
  runApp(const MyApp());
}

// Define your custom text styles here
TextTheme customTextTheme = TextTheme(
  bodyLarge: TextStyle(
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
      // home: const askperson(),
      // home: const homepage(),
      routes: {
        MyRoutes.signinRoutes: (context) => const signinpage(),
        MyRoutes.signupRoutes: (context) => const signuppage(),
        MyRoutes.eventsRoutes: (context) => const EventsPage(),
        MyRoutes.homeRoutes: (context) => const homepage(),
        MyRoutes.drawerRoute: (context) => const MyDrawer(),
        MyRoutes.sosRoute: (context) => const SOSpage(),
        MyRoutes.splashRoute: (context) => const Splash(),
        MyRoutes.cancelRoutes: (context) => const TimeGiven(),
        MyRoutes.askthem: (context) => const askperson(),
        // MyRoutes.otpRoute: (context) => OTPScreen(email: ,),
        MyRoutes.profileRoute: (context) => const Profile(),
        MyRoutes.previewride: (context) => const PrepareRide(),
        // MyRoutes.accdecRoutes: (context) => AcceptDecline(),
        //MyRoutes.mapRoute: (context) => MyMapapi(),
      },
    );
  }
}
