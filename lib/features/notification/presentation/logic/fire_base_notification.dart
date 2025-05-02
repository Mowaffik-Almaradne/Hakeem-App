import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/cubit/button_nav_cubit.dart';
import 'package:toastification/toastification.dart';

class FirebaseApi {
  // Create instance for Firebase Messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  // Define a global key for the navigator
  final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  // Get the current BuildContext from the navigator key
  BuildContext? get context => navKey.currentContext;

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
    initPushNotification();
  }

  // Function to handle received messaging
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    if (kDebugMode) {
      print('message click!');
    }

    // Ensure context is not null before using it
    if (context != null) {
      context?.read<ButtonNavCubit>().changeIndexButtonNav(2, context!);
    }
  }

  // Function to initialize push notification settings
  Future<void> initPushNotification() async {
    // Handle notification if the app was terminated and now opened
    _firebaseMessaging.getInitialMessage().then(handleMessage);

    // Attach an event listener for when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    // Handle notifications in the foreground
    FirebaseMessaging.onMessage.listen((message) {
      toastification.show(
        showProgressBar: false,
        title: const Text('تنبيه'),
        description: const Text("يوجد لديك إشعار جديد"),
        type: ToastificationType.info,
        style: ToastificationStyle.fillColored,
      );
    });

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}

// Background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // This will be called when the app is in the background or terminated
  if (kDebugMode) {
    print('Handling a background message: ${message.messageId}');
  }

  // You can handle your background message here
  // For example, you can show a notification, log the message, etc.
}
