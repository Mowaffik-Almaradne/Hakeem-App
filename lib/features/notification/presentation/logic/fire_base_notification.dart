import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  // Function to initialize notifications
  Future<void> initNotifications() async {
    // Request permission from the user
    await _firebaseMessaging.requestPermission();

    // Fetch the token
    final token = await _firebaseMessaging.getToken();

    // Print the token for debugging
    if (kDebugMode) {
      print('token: $token');
    }

    // Initialize push notification handlers
  }
}
