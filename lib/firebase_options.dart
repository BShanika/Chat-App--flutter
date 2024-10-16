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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyACieHywHXX6_dACbFONW8H2iaNVEH2V5c',
    appId: '1:939004998483:android:0b02ccfab0cf76d58ce7a6',
    messagingSenderId: '939004998483',
    projectId: 'chatapp-8ab82',
    storageBucket: 'chatapp-8ab82.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBdhozWJaxEZzPBC0ttqytGja6NU33T0Ls',
    appId: '1:939004998483:ios:6c60fd7194f6019b8ce7a6',
    messagingSenderId: '939004998483',
    projectId: 'chatapp-8ab82',
    storageBucket: 'chatapp-8ab82.appspot.com',
    androidClientId: '939004998483-mqb6t0bfuda5q1pcqsrdjegn7qhv3d8a.apps.googleusercontent.com',
    iosClientId: '939004998483-4jhkp6k66a1bj6llq0jcp21c00lhjgmn.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

}