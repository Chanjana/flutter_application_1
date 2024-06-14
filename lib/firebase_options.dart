// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBRYLY28kNTVNtwo4uJM8GHLcGtk3DREzk',
    appId: '1:795379289511:web:7f851482cf4737dce8fa82',
    messagingSenderId: '795379289511',
    projectId: 'fireconnect-fdb42',
    authDomain: 'fireconnect-fdb42.firebaseapp.com',
    storageBucket: 'fireconnect-fdb42.appspot.com',
    measurementId: 'G-R4BCQM7BMS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJSRTiYNw40tyMZPpUDT1GK2OZm-hZotY',
    appId: '1:795379289511:android:82693c2fb3682e30e8fa82',
    messagingSenderId: '795379289511',
    projectId: 'fireconnect-fdb42',
    storageBucket: 'fireconnect-fdb42.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAw5qaMs-fhjqJwFugRBUgFTL75FjOE9IQ',
    appId: '1:795379289511:ios:f56f903f3f2bd786e8fa82',
    messagingSenderId: '795379289511',
    projectId: 'fireconnect-fdb42',
    storageBucket: 'fireconnect-fdb42.appspot.com',
    iosBundleId: 'com.example.cafeAmericanoTwo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAw5qaMs-fhjqJwFugRBUgFTL75FjOE9IQ',
    appId: '1:795379289511:ios:f56f903f3f2bd786e8fa82',
    messagingSenderId: '795379289511',
    projectId: 'fireconnect-fdb42',
    storageBucket: 'fireconnect-fdb42.appspot.com',
    iosBundleId: 'com.example.cafeAmericanoTwo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBRYLY28kNTVNtwo4uJM8GHLcGtk3DREzk',
    appId: '1:795379289511:web:4e95a121927a331ae8fa82',
    messagingSenderId: '795379289511',
    projectId: 'fireconnect-fdb42',
    authDomain: 'fireconnect-fdb42.firebaseapp.com',
    storageBucket: 'fireconnect-fdb42.appspot.com',
    measurementId: 'G-8QQFSES4PN',
  );

}