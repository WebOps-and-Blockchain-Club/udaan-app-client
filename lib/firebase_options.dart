// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD-wos0_CNH2hfz08nkX6gsIVJ-mcG81Is',
    appId: '1:441073967185:web:2a0b44a2c5cc9406df1870',
    messagingSenderId: '441073967185',
    projectId: 'ncc-udaan',
    authDomain: 'ncc-udaan.firebaseapp.com',
    databaseURL: 'https://ncc-udaan-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ncc-udaan.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAgUwchpKBMA05NBaV2Bjmf3_OcUgoSvdE',
    appId: '1:441073967185:android:1355677176719827df1870',
    messagingSenderId: '441073967185',
    projectId: 'ncc-udaan',

    databaseURL: 'https://ncc-udaan-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'ncc-udaan.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDRo3nEkgEbd-mDsQSoGRXZdfY1aL3N1SE',
    appId: '1:441073967185:ios:72739dda61ce977adf1870',
    messagingSenderId: '441073967185',
    projectId: 'ncc-udaan',
    databaseURL: 'https://ncc-udaan-default-rtdb.asia-southeast1.firebasedatabase.app',

    storageBucket: 'ncc-udaan.appspot.com',
    iosBundleId: 'com.cfiwebops.ncc_udaan',
  );
}
