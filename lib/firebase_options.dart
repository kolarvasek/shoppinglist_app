
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyBDNR5TOqYFrJU4PPFZ5AU-I-KOgfyO8TY',
    appId: '1:443312307252:android:de6a3b388ed4e7659bde61',
    messagingSenderId: '443312307252',
    projectId: 'shopping-list-aa6d0',
    storageBucket: 'shopping-list-aa6d0.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAGEEG-yujy96I4MotqoWakmxQ-G43wJjE',
    appId: '1:443312307252:ios:4f86ede463c742699bde61',
    messagingSenderId: '443312307252',
    projectId: 'shopping-list-aa6d0',
    storageBucket: 'shopping-list-aa6d0.firebasestorage.app',
    iosBundleId: 'com.example.shoppinglist',
  );
}
