import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mapbox_turn_by_turn/main.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title : ${message.notification?.title}');
  print('Body : ${message.notification?.body}');
  print('Payload : ${message.data}');
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final FCMToken = await _firebaseMessaging.getToken();
    print(FCMToken);
    sharedPreferences.setString("fcmToken", FCMToken.toString());
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
