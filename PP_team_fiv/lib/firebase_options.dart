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
    apiKey: 'AIzaSyAxSH0E3gfHj5RzfWzFtPa0enXS6LzziWw',
    appId: '1:914941901972:web:c5b369a60a9760e8d80881',
    messagingSenderId: '914941901972',
    projectId: 'try-ph',
    authDomain: 'try-ph.firebaseapp.com',
    storageBucket: 'try-ph.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-nicW0cwxEEI5cldksSh03rQrn1-bl7c',
    appId: '1:914941901972:android:c3244e59fe38cf1bd80881',
    messagingSenderId: '914941901972',
    projectId: 'try-ph',
    storageBucket: 'try-ph.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD5a9vJ_3brsQOfXBjM74lcAYm0DW285tk',
    appId: '1:914941901972:ios:f57182eafd8b3499d80881',
    messagingSenderId: '914941901972',
    projectId: 'try-ph',
    storageBucket: 'try-ph.appspot.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD5a9vJ_3brsQOfXBjM74lcAYm0DW285tk',
    appId: '1:914941901972:ios:f57182eafd8b3499d80881',
    messagingSenderId: '914941901972',
    projectId: 'try-ph',
    storageBucket: 'try-ph.appspot.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAxSH0E3gfHj5RzfWzFtPa0enXS6LzziWw',
    appId: '1:914941901972:web:7b205435819c566dd80881',
    messagingSenderId: '914941901972',
    projectId: 'try-ph',
    authDomain: 'try-ph.firebaseapp.com',
    storageBucket: 'try-ph.appspot.com',
  );
}
