import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions get platformOptions {
    
      // Android
      return const FirebaseOptions(
        appId: '1:1004191816669:android:2200c3f7c88d0912a47434',
        apiKey: 'AIzaSyCb4S6t1nmNv4URjPGwyBe0cpTHNQPsc8U',
        projectId: 'flutteruyg',
        messagingSenderId: '',
      );
    }
  
}