// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// class NotificationService {
//   static final FlutterLocalNotificationsPlugin _notificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   // Initialization settings for Android
//   static Future<void> initialize() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);

//     await _notificationsPlugin.initialize(initializationSettings);
//   }

//   // Schedule a notification at a specific time
//   static Future<void> scheduleNotification(
//       int id, String title, String body, DateTime scheduledTime) async {
//     // Convert DateTime to time zone aware format
//     tz.initializeTimeZones();
//     final tz.TZDateTime scheduledDateTime = tz.TZDateTime.from(
//       scheduledTime,
//       tz.local,
//     );

//     const AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails(
//       'alarm_channel',
//       'Alarm Notifications',
//       // 'Channel for Alarm notifications',
//       importance: Importance.max,
//       priority: Priority.high,
//       ticker: 'ticker',
//     );

//     const NotificationDetails notificationDetails =
//         NotificationDetails(android: androidNotificationDetails);

//     await _notificationsPlugin.zonedSchedule(
//       id,
//       title,
//       body,
//       scheduledDateTime,
//       notificationDetails,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: DateTimeComponents.time, // Trigger at exact time
//     );
//   }
// }
