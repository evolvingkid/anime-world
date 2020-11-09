import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotificationservices {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  void onMessageSet({
    Future<dynamic> Function(Map<String, dynamic>) onMessage,
    Future<dynamic> Function(Map<String, dynamic>) onBackgroundMessage,
    Future<dynamic> Function(Map<String, dynamic>) onLaunch,
    Future<dynamic> Function(Map<String, dynamic>) onResume,
  }) {
    _firebaseMessaging.configure(
      onMessage: onMessage,
      onBackgroundMessage: onBackgroundMessage,
      onLaunch: onLaunch,
      onResume: onResume,
    );
  }

  void messageSubscription() { 
    _firebaseMessaging.subscribeToTopic('news');
  }
}
