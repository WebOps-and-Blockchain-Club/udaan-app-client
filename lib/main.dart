import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_turn_by_turn/oldpages/EventsPage.dart';
import 'package:mapbox_turn_by_turn/oldpages/SOSpage.dart';
import 'package:mapbox_turn_by_turn/oldpages/askperson.dart';
import 'package:mapbox_turn_by_turn/oldpages/cancel_request.dart';
import 'package:mapbox_turn_by_turn/oldpages/homepage.dart';
import 'package:mapbox_turn_by_turn/oldpages/user_message.dart';
import 'package:mapbox_turn_by_turn/screens/prepare_ride.dart';
import 'package:mapbox_turn_by_turn/screens/profile_per.dart';
import 'package:mapbox_turn_by_turn/widgets/MyDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mapbox_turn_by_turn/utils/MyRoutes.dart';
import 'oldpages/accept_decline.dart';
import 'oldpages/askperson.dart';
import 'oldpages/signinpage.dart';
import 'oldpages/signuppage.dart';
import 'ui/splash.dart';
import 'package:mapbox_turn_by_turn/widgets/dotenv.dart';

late SharedPreferences sharedPreferences;

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await FirebaseApi().initNotification();0

  // sharedPreferences = await SharedPreferences.getInstance();
  // await dotenv.load(fileName: "assets/config/.env");
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
        // MyRoutes.accdecRoutes: (context) => AcceptDecline(),
        // MyRoutes.MessageRoute: (context) => MessagePage(),
        //MyRoutes.mapRoute: (context) => MyMapapi(),
      },
    );
  }
}
