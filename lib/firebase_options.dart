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
    apiKey: 'AIzaSyASYy3TMwq2H9EBmS6bAApMe6AQF7S4vyo',
    appId: '1:221433184799:web:ef610c51ae880feff68b2a',
    messagingSenderId: '221433184799',
    projectId: 'mini-project-58a26',
    authDomain: 'mini-project-58a26.firebaseapp.com',
    storageBucket: 'mini-project-58a26.appspot.com',
    measurementId: 'G-DEC1FXL43L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBj9kPSRtCcoPJyP9k-bOaTG7_uw4MC9aw',
    appId: '1:221433184799:android:68960fc8f6ce5022f68b2a',
    messagingSenderId: '221433184799',
    projectId: 'mini-project-58a26',
    storageBucket: 'mini-project-58a26.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDjyM3F3TQ2guZVJs1NTUsw1lcxnlwzbQU',
    appId: '1:221433184799:ios:c370c6cefa0205fef68b2a',
    messagingSenderId: '221433184799',
    projectId: 'mini-project-58a26',
    storageBucket: 'mini-project-58a26.appspot.com',
    iosBundleId: 'com.example.miniProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDjyM3F3TQ2guZVJs1NTUsw1lcxnlwzbQU',
    appId: '1:221433184799:ios:c370c6cefa0205fef68b2a',
    messagingSenderId: '221433184799',
    projectId: 'mini-project-58a26',
    storageBucket: 'mini-project-58a26.appspot.com',
    iosBundleId: 'com.example.miniProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyASYy3TMwq2H9EBmS6bAApMe6AQF7S4vyo',
    appId: '1:221433184799:web:99e3cef1a2ef5e82f68b2a',
    messagingSenderId: '221433184799',
    projectId: 'mini-project-58a26',
    authDomain: 'mini-project-58a26.firebaseapp.com',
    storageBucket: 'mini-project-58a26.appspot.com',
    measurementId: 'G-R9VBDXWPC7',
  );
}