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
    apiKey: 'AIzaSyAohT_0rteSlR2KbzX09eCbF6aEGsbNSWk',
    appId: '1:762466139865:web:195e0845e7aeb5eb80c8c8',
    messagingSenderId: '762466139865',
    projectId: 'instagramclone-534b9',
    authDomain: 'instagramclone-534b9.firebaseapp.com',
    storageBucket: 'instagramclone-534b9.appspot.com',
    measurementId: 'G-JQWXW6EHF7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3S0EypXPOqdAVItfD1p-bZhyIvpcOEKE',
    appId: '1:762466139865:android:b22a411efc6c2a0880c8c8',
    messagingSenderId: '762466139865',
    projectId: 'instagramclone-534b9',
    storageBucket: 'instagramclone-534b9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBubNUhhJAj4b4MJ3EGxbWP_4h406mWF9c',
    appId: '1:762466139865:ios:2004a32dd72e826080c8c8',
    messagingSenderId: '762466139865',
    projectId: 'instagramclone-534b9',
    storageBucket: 'instagramclone-534b9.appspot.com',
    iosBundleId: 'com.example.flutterclone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBubNUhhJAj4b4MJ3EGxbWP_4h406mWF9c',
    appId: '1:762466139865:ios:e9cec67abc70c63d80c8c8',
    messagingSenderId: '762466139865',
    projectId: 'instagramclone-534b9',
    storageBucket: 'instagramclone-534b9.appspot.com',
    iosBundleId: 'com.example.flutterclone.RunnerTests',
  );
}