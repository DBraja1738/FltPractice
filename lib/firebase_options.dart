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
    apiKey: 'AIzaSyBNZk2FUgjl9KxBXH5DNH8xs__KykKyFtU',
    appId: '1:936925113565:web:dce699b0619e125837bf34',
    messagingSenderId: '936925113565',
    projectId: 'testing-login-54757',
    authDomain: 'testing-login-54757.firebaseapp.com',
    storageBucket: 'testing-login-54757.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBNXHgj577trnfMCFpvBM6Pxpmp-EhkXl8',
    appId: '1:936925113565:android:b900f46691dcdfb037bf34',
    messagingSenderId: '936925113565',
    projectId: 'testing-login-54757',
    storageBucket: 'testing-login-54757.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDYP_xU9c6M3uWx9ylo8M160coSU8KKk4A',
    appId: '1:936925113565:ios:74b36e76d8c529b837bf34',
    messagingSenderId: '936925113565',
    projectId: 'testing-login-54757',
    storageBucket: 'testing-login-54757.appspot.com',
    iosBundleId: 'com.example.basicsidebars',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDYP_xU9c6M3uWx9ylo8M160coSU8KKk4A',
    appId: '1:936925113565:ios:74b36e76d8c529b837bf34',
    messagingSenderId: '936925113565',
    projectId: 'testing-login-54757',
    storageBucket: 'testing-login-54757.appspot.com',
    iosBundleId: 'com.example.basicsidebars',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBNZk2FUgjl9KxBXH5DNH8xs__KykKyFtU',
    appId: '1:936925113565:web:b6074278e54ae50f37bf34',
    messagingSenderId: '936925113565',
    projectId: 'testing-login-54757',
    authDomain: 'testing-login-54757.firebaseapp.com',
    storageBucket: 'testing-login-54757.appspot.com',
  );
}
