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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDMwC9EF3dPTJHrFFSMNCKmQAWqRQ4ZMLA',
    appId: '1:628341249394:android:01a845f7c44b422ea279eb',
    messagingSenderId: '628341249394',
    projectId: 'mesenger-app-b4cdb',
    storageBucket: 'mesenger-app-b4cdb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8_XN0kaeurBjgh4Mu0wkJLgUNmG2YlVU',
    appId: '1:628341249394:ios:ad765a378e578747a279eb',
    messagingSenderId: '628341249394',
    projectId: 'mesenger-app-b4cdb',
    storageBucket: 'mesenger-app-b4cdb.appspot.com',
    iosClientId: '628341249394-jkr1326rqh9c9bq9ftt2505m8bfgnt19.apps.googleusercontent.com',
    iosBundleId: 'com.example.messengerApp',
    databaseURL: 'https://mesenger-app-b4cdb-default-rtdb.asia-southeast1.firebasedatabase.app'
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8_XN0kaeurBjgh4Mu0wkJLgUNmG2YlVU',
    appId: '1:628341249394:ios:ad765a378e578747a279eb',
    messagingSenderId: '628341249394',
    projectId: 'mesenger-app-b4cdb',
    storageBucket: 'mesenger-app-b4cdb.appspot.com',
    iosClientId: '628341249394-jkr1326rqh9c9bq9ftt2505m8bfgnt19.apps.googleusercontent.com',
    iosBundleId: 'com.example.messengerApp',
  );
}
