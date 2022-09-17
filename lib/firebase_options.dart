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
    apiKey: 'AIzaSyAdX_iGYHRO_dEF43ZwPlzQxY3BdrsWda0',
    appId: '1:1097947227307:web:08347b1c93ba1f22e1c3ee',
    messagingSenderId: '1097947227307',
    projectId: 'realix-5f39f',
    authDomain: 'realix-5f39f.firebaseapp.com',
    storageBucket: 'realix-5f39f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD82Y2yI5ylQYUyYGS97BLOPIKbBOgd0Y4',
    appId: '1:1097947227307:android:105442f221492988e1c3ee',
    messagingSenderId: '1097947227307',
    projectId: 'realix-5f39f',
    storageBucket: 'realix-5f39f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAlLs_GN_5nZ31cR8p1jIjGZGIPjln7IDc',
    appId: '1:1097947227307:ios:8db68c0a539bbd91e1c3ee',
    messagingSenderId: '1097947227307',
    projectId: 'realix-5f39f',
    storageBucket: 'realix-5f39f.appspot.com',
    iosClientId: '1097947227307-vppp3j2k168pmob0pqnhn34v08muj9jb.apps.googleusercontent.com',
    iosBundleId: 'com.example.realix',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAlLs_GN_5nZ31cR8p1jIjGZGIPjln7IDc',
    appId: '1:1097947227307:ios:8db68c0a539bbd91e1c3ee',
    messagingSenderId: '1097947227307',
    projectId: 'realix-5f39f',
    storageBucket: 'realix-5f39f.appspot.com',
    iosClientId: '1097947227307-vppp3j2k168pmob0pqnhn34v08muj9jb.apps.googleusercontent.com',
    iosBundleId: 'com.example.realix',
  );
}
