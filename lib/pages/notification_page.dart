import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage?;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: message == null ? const Center(child: Text('No notification data')) : Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(message.notification?.title ?? 'No Title'),

            Text(message.notification?.body ?? 'No Body'),

            Text(message.data.toString()),
          ],
        ),
      ),
    );
  }
}
