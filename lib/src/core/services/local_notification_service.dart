// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class LocalNotificationService {
//   static final FlutterLocalNotificationsPlugin _notifications =
//       FlutterLocalNotificationsPlugin();

//   static Future<void> init() async {
//     const androidSettings = AndroidInitializationSettings(
//       '@mipmap/ic_launcher',
//     );

//     const iosSettings = DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//     );

//     const settings = InitializationSettings(
//       android: androidSettings,
//       iOS: iosSettings,
//     );

//     await _notifications.initialize(
//       settings: settings,
//       onDidReceiveNotificationResponse: (details) {
//         if (kDebugMode) {
//           print('Notification clicked: ${details.payload}');
//         }
//       },
//     );
//   }

//   static Future<void> showNotification({
//     int id = 0,
//     required String title,
//     required String body,
//     String? payload,
//   }) async {
//     const androidDetails = AndroidNotificationDetails(
//       'daily_leaf_channel',
//       'Daily Leaf News',
//       channelDescription: 'Notifications for breaking news',
//       importance: Importance.max,
//       priority: Priority.high,
//     );

//     const iosDetails = DarwinNotificationDetails();

//     const details = NotificationDetails(
//       android: androidDetails,
//       iOS: iosDetails,
//     );

//     await _notifications.show(
//       id: id,
//       title: title,
//       body: body,
//       notificationDetails: details,
//       payload: payload,
//     );
//   }
// }
