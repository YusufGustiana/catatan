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
    apiKey: 'AIzaSyD6s0de3DK6Kn3fFMSildDJK3PpuJajRww',
    appId: '1:73876933083:web:9d4f2bd88d3bb5764bbffe',
    messagingSenderId: '73876933083',
    projectId: 'catatb-aps',
    authDomain: 'catatb-aps.firebaseapp.com',
    storageBucket: 'catatb-aps.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCsbHe01G48GT7phcMgF-jEewnvkmwA_WY',
    appId: '1:73876933083:android:54c90f12e426e5d94bbffe',
    messagingSenderId: '73876933083',
    projectId: 'catatb-aps',
    storageBucket: 'catatb-aps.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCC5BPmWGJm1DfV2L8ygMsZFZNEHgC4R9o',
    appId: '1:73876933083:ios:ad65915d9d54826f4bbffe',
    messagingSenderId: '73876933083',
    projectId: 'catatb-aps',
    storageBucket: 'catatb-aps.appspot.com',
    iosClientId:
        '73876933083-tam1om24c9pubieto2t0tdl6svoah8fa.apps.googleusercontent.com',
    iosBundleId: 'com.example.catatan',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCC5BPmWGJm1DfV2L8ygMsZFZNEHgC4R9o',
    appId: '1:73876933083:ios:ad65915d9d54826f4bbffe',
    messagingSenderId: '73876933083',
    projectId: 'catatb-aps',
    storageBucket: 'catatb-aps.appspot.com',
    iosClientId:
        '73876933083-tam1om24c9pubieto2t0tdl6svoah8fa.apps.googleusercontent.com',
    iosBundleId: 'com.example.catatan',
  );
}
