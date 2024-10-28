import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:notifications_flutter/main.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    final fcmToken = await _firebaseMessaging.getToken();
    print('FCM Token: $fcmToken');

    initPushNotifications();
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    navigatorKey.currentState?.pushNamed(
      '/notification_screen',
      arguments: message,
    );
  }

  Future<void> initPushNotifications() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    FirebaseMessaging.onMessage.listen((message) {
      // Custom logic for displaying notifications in foreground
      print('Message received in foreground: ${message.notification?.title}');
    });

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
