import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:nilay/utils/constants.dart';
import 'package:nilay/utils/preferences_manager.dart';

class FirebaseApi {

  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    // PreferencesManager.saveUserToken(key: Const.KEY_FIREBASE_TOKEN, token: fCMToken!);
    print('FIREBASE_TOKEN: ${fCMToken}');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('NOTI TITLE: ${message.notification?.title}');
  print('NOTI BODY: ${message.notification?.body}');
  print('NOTI PAYLOAD: ${jsonEncode(message.data)}');
}