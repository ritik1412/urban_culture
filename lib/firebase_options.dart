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
    apiKey: 'AIzaSyA9ZSSykUVH1IluLjMERmu7xUSA8ibplb8',
    appId: '1:258995600336:web:054c548e0c2ba3e69b57d5',
    messagingSenderId: '258995600336',
    projectId: 'urban-culture-706a0',
    authDomain: 'urban-culture-706a0.firebaseapp.com',
    storageBucket: 'urban-culture-706a0.appspot.com',
    measurementId: 'G-L9TFQEWTWK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDfEGvyzJKqOimzsivYwuONGx73tjFT00Y',
    appId: '1:258995600336:android:3973082e314714029b57d5',
    messagingSenderId: '258995600336',
    projectId: 'urban-culture-706a0',
    storageBucket: 'urban-culture-706a0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCjCfjdfONfc3bcBUjgsQYlflD6KlcAKeM',
    appId: '1:258995600336:ios:820a1fae6642e07e9b57d5',
    messagingSenderId: '258995600336',
    projectId: 'urban-culture-706a0',
    storageBucket: 'urban-culture-706a0.appspot.com',
    iosBundleId: 'com.example.urbanCulture',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCjCfjdfONfc3bcBUjgsQYlflD6KlcAKeM',
    appId: '1:258995600336:ios:a7db03a9bce2afcd9b57d5',
    messagingSenderId: '258995600336',
    projectId: 'urban-culture-706a0',
    storageBucket: 'urban-culture-706a0.appspot.com',
    iosBundleId: 'com.example.urbanCulture.RunnerTests',
  );
}
