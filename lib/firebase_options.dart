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
        return macos;
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
    apiKey: 'AIzaSyAUCGk3dy6fd0yuLfHJnyUxgvjP6j2lMAU',
    appId: '1:593385696007:web:8e9406d1897353cc6673a2',
    messagingSenderId: '593385696007',
    projectId: 'business-3666c',
    authDomain: 'business-3666c.firebaseapp.com',
    storageBucket: 'business-3666c.appspot.com',
    measurementId: 'G-5J5YZZQNGM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBc_-sF8R_ionm08MM37yg-iSxZhMlELzM',
    appId: '1:593385696007:android:ac30ab1505f05a006673a2',
    messagingSenderId: '593385696007',
    projectId: 'business-3666c',
    storageBucket: 'business-3666c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBh79vJfxvjhOnpg_5wYG8fTFzHiDZN0sY',
    appId: '1:593385696007:ios:5f30b2a428f837dc6673a2',
    messagingSenderId: '593385696007',
    projectId: 'business-3666c',
    storageBucket: 'business-3666c.appspot.com',
    androidClientId: '593385696007-7nhkopr5rcm2sm5gm7sh4vqftqm2bbvb.apps.googleusercontent.com',
    iosClientId: '593385696007-2d284o2ct6dvu93t47sjqk3t177dt0ph.apps.googleusercontent.com',
    iosBundleId: 'ps.app.carstore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBh79vJfxvjhOnpg_5wYG8fTFzHiDZN0sY',
    appId: '1:593385696007:ios:cfab9be6b22bb3e86673a2',
    messagingSenderId: '593385696007',
    projectId: 'business-3666c',
    storageBucket: 'business-3666c.appspot.com',
    androidClientId: '593385696007-7nhkopr5rcm2sm5gm7sh4vqftqm2bbvb.apps.googleusercontent.com',
    iosClientId: '593385696007-55h5smpdkbvcop7r3lc85si89a1vgmp9.apps.googleusercontent.com',
    iosBundleId: 'hamza.a.eCommerceCar.RunnerTests',
  );
}