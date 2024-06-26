

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_turn_by_turn/oldpages/EventsPage.dart';
import 'package:mapbox_turn_by_turn/oldpages/SOSpage.dart';
import 'package:mapbox_turn_by_turn/oldpages/askperson.dart';
import 'package:mapbox_turn_by_turn/oldpages/cancel_request.dart';
import 'package:mapbox_turn_by_turn/oldpages/homepage.dart';
import 'package:mapbox_turn_by_turn/screens/prepare_ride.dart';
import 'package:mapbox_turn_by_turn/screens/profile_per.dart';
import 'package:mapbox_turn_by_turn/widgets/MyDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
import 'oldpages/accept_decline.dart';
import 'oldpages/signinpage.dart';
import 'oldpages/signuppage.dart';
import 'ui/splash.dart';
import 'package:mapbox_turn_by_turn/widgets/dotenv.dart';

// firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

late SharedPreferences sharedPreferences;
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background Message : ${message.notification?.title}");
  print("Handling a background Message : ${message.notification?.body}");
  print("Handling a background Message : ${message.data}");
}


Future<void> initPushNotifications(BuildContext context) async {
  print('Initialized AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.instance.getInitialMessage().then((message) => handleMessage(context, message));
  FirebaseMessaging.onMessageOpenedApp.listen((message) => handleMessage(context, message));
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((message) {
    final notification = message.notification;
    if (notification == null) return;
  });
}

void handleMessage(BuildContext context, message) {
  print('<=========== $message ============>');
  if (message == null) return;
  print("navigating to events page");
  // Navigator.push(context, MaterialPageRoute(builder: (context) => EventsPage()));
  Navigator.pushNamed(context, MyRoutes.eventsRoutes, arguments: message.data);
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
  loadDotenv();
  runApp(const MyApp());
}

String ngroklink = dotenv.env['NGROK_LINK'] ?? '';
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
    initPushNotifications(context);

    return MaterialApp(
      //title: 'UDAAN NCC',
      debugShowCheckedModeBanner: false,
      //theme: customTheme, // Use the custom theme here

      // home: AcceptDecline(),
      // home: askperson(),
      // home: const EventsPage(),
      routes: {
        MyRoutes.signinRoutes: (context) => const signinpage(),
        MyRoutes.signupRoutes: (context) => const signuppage(),
        MyRoutes.eventsRoutes: (context) => EventsPage(),
        MyRoutes.homeRoutes: (context) => const homepage(),
        MyRoutes.drawerRoute: (context) => MyDrawer(),
        MyRoutes.sosRoute: (context) => const SOSpage(),
        MyRoutes.splashRoute: (context) => const Splash(),
        MyRoutes.cancelRoutes: (context) => const TimeGiven(),
        MyRoutes.askthem: (context) => const askperson(),
        // MyRoutes.otpRoute: (context) => OTPScreen(email: ,),
        MyRoutes.profileRoute: (context) => const Profile(),
        MyRoutes.previewride: (context) => const PrepareRide(),
        // MyRoutes.accdecRoutes: (context) => AcceptDecline(),
        // MyRoutes.MessageRoute: (context) => MessagePage(),
        //MyRoutes.mapRoute: (context) => MyMapapi(),
      },
    );
  }
}
