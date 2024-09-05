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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCBsQK5atYmQSGEM-U3wBOQR0EiafMFTvI',
    appId: '1:129054512410:web:d652f8e6969da8acf408a3',
    messagingSenderId: '129054512410',
    projectId: 'flutter-klab',
    authDomain: 'flutter-klab.firebaseapp.com',
    storageBucket: 'flutter-klab.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAypWVoo605bu8VhfTHiS3sT01wEhlGryQ',
    appId: '1:129054512410:android:1150af5704d6356df408a3',
    messagingSenderId: '129054512410',
    projectId: 'flutter-klab',
    storageBucket: 'flutter-klab.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDl25AcDIobi_EFjxE97Q_dbc_2CWssrY4',
    appId: '1:129054512410:ios:cbf5184c2b23af16f408a3',
    messagingSenderId: '129054512410',
    projectId: 'flutter-klab',
    storageBucket: 'flutter-klab.appspot.com',
    iosBundleId: 'com.example.codeTutoorial',
  );
}