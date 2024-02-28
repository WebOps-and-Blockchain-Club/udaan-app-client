import 'dart:convert';
import 'dart:html';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mapbox_turn_by_turn/api/firebase_api.dart';
import 'package:mapbox_turn_by_turn/oldpages/EventsPage.dart';
import 'package:mapbox_turn_by_turn/oldpages/SOSpage.dart';
import 'package:mapbox_turn_by_turn/oldpages/askperson.dart';
import 'package:mapbox_turn_by_turn/oldpages/cancel_request.dart';
import 'package:mapbox_turn_by_turn/oldpages/chatpage.dart';
import 'package:mapbox_turn_by_turn/oldpages/homepage.dart';
import 'package:mapbox_turn_by_turn/screens/prepare_ride.dart';
import 'package:mapbox_turn_by_turn/screens/profile_per.dart';
import 'package:mapbox_turn_by_turn/widgets/MyDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
import 'package:mapbox_turn_by_turn/oldpages/accept_decline.dart';
import 'package:mapbox_turn_by_turn/oldpages/signinpage.dart';
import 'package:mapbox_turn_by_turn/oldpages/signuppage.dart';
import 'package:mapbox_turn_by_turn/ui/splash.dart';
import 'package:mapbox_turn_by_turn/widgets/dotenv.dart';

// Firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

late SharedPreferences sharedPreferences;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background Message : ${message.messageId}");
}

final notificationNavKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///////////////////////////////////
  // FIREBASE MESSAGING
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  const _androidChannel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications',
    importance: Importance.defaultImportance,
  );

  final _localNotifications = FlutterLocalNotificationsPlugin();

  void handleMessage(BuildContext context, RemoteMessage? message) {
    if (message == null) return;
    Navigator.pushNamed(context, MyRoutes.accdecRoutes, arguments: message);
  }

  Future<void> initPushNotifications(BuildContext context) async {
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

      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@mipmap/ic_launcher',
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  // Future<void> initLocalNotifications() async {
  //   // const iOS = IOSInitializationSettings();
  //   const android = AndroidInitializationSettings('@mipmap/ic_launcher');
  //   const settings = InitializationSettings(android: android); // , iOS: iOS
  //
  //   await _localNotifications.initialize(
  //     settings,
  //     onSelectNotification: (payload) {
  //       final message = RemoteMessage.fromMap(jsonDecode(payload));
  //       handleMessage(notificationNavKey.currentContext!, message);
  //     },
  //   );
  //
  //   final platform = _localNotifications.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
  //   await platform?.createNotificationChannel(_androidChannel);
  // }

  final notificationSettings = await FirebaseMessaging.instance.requestPermission(provisional: true);
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print("fcmToken is ${fcmToken} ");
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FirebaseMessaging.instance.setAutoInitEnabled(true);

  ////////////////////////////////////////
  sharedPreferences = await SharedPreferences.getInstance();
  await dotenv.load(fileName: "assets/config/.env");
  loadDotenv();
  runApp(MyApp());
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
    return MaterialApp(
      //title: 'UDAAN NCC',
      debugShowCheckedModeBanner: false,
      //theme: customTheme, // Use the custom theme here

      // home: AcceptDecline(),
      // home: askperson(),
      //home: const homepage(),
      routes: {
        MyRoutes.signinRoutes: (context) => const signinpage(),
        MyRoutes.signupRoutes: (context) => const signuppage(),
        MyRoutes.eventsRoutes: (context) => const EventsPage(),
        MyRoutes.homeRoutes: (context) => const homepage(),
        MyRoutes.drawerRoute: (context) => MyDrawer(),
        MyRoutes.sosRoute: (context) => const SOSpage(),
        MyRoutes.splashRoute: (context) => const Splash(),
        MyRoutes.cancelRoutes: (context) => const TimeGiven(),
        MyRoutes.askthem: (context) => const askperson(),
        // MyRoutes.otpRoute: (context) => OTPScreen(email: ,),
        MyRoutes.profileRoute: (context) => const Profile(),
        MyRoutes.previewride: (context) => const PrepareRide(),
        MyRoutes.accdecRoutes: (context) => AcceptDecline(),
        // MyRoutes.MessageRoute: (context) => MessagePage(),
        //MyRoutes.mapRoute: (context) => MyMapapi(),
        // MyRoutes.chatpage: (context) => MyChatApp()
      },
    );
  }
}
