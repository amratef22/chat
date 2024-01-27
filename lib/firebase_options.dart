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
    apiKey: 'AIzaSyDdAqi_XxUz4QcmzYAnS_5wpB4ZuoFrxzE',
    appId: '1:381745138361:web:9601c28f8ebd778144a968',
    messagingSenderId: '381745138361',
    projectId: 'chat-app-20ec4',
    authDomain: 'chat-app-20ec4.firebaseapp.com',
    storageBucket: 'chat-app-20ec4.appspot.com',
    measurementId: 'G-YHJZTGBPHT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBNghMrN2hndchmQWAi3uKcisAqsGmarh8',
    appId: '1:381745138361:android:087de4d42362e66e44a968',
    messagingSenderId: '381745138361',
    projectId: 'chat-app-20ec4',
    storageBucket: 'chat-app-20ec4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAMBoT0DTFyrNZWLAVKZq6MEPVQxsLpDPw',
    appId: '1:381745138361:ios:df7453ff35b0b9f744a968',
    messagingSenderId: '381745138361',
    projectId: 'chat-app-20ec4',
    storageBucket: 'chat-app-20ec4.appspot.com',
    iosBundleId: 'com.example.chatyApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAMBoT0DTFyrNZWLAVKZq6MEPVQxsLpDPw',
    appId: '1:381745138361:ios:0cb6c1d841e91a3244a968',
    messagingSenderId: '381745138361',
    projectId: 'chat-app-20ec4',
    storageBucket: 'chat-app-20ec4.appspot.com',
    iosBundleId: 'com.example.chatyApp.RunnerTests',
  );
}
