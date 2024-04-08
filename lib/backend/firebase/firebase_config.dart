import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBBHXNyq0KbqDA61MOoRf6zJRltOokS_4g",
            authDomain: "e-mind-mirror-isx1dz.firebaseapp.com",
            projectId: "e-mind-mirror-isx1dz",
            storageBucket: "e-mind-mirror-isx1dz.appspot.com",
            messagingSenderId: "1035601623427",
            appId: "1:1035601623427:web:4a6c701ff20f7ff33d5eb6"));
  } else {
    await Firebase.initializeApp();
  }
}
