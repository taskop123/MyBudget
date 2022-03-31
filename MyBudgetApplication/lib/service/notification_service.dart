import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../util/constants.dart';

class NotificationService {
  static const String notificationTitle = Constants.applicationTitle;
  static const String notificationPayload = Constants.notificationTitle;
  static final _notifications = FlutterLocalNotificationsPlugin();

  static init() {
    const android = AndroidInitializationSettings(Constants.launcherUrl);
    const ios = IOSInitializationSettings();
    const settings = InitializationSettings(android: android, iOS: ios);

    _notifications.initialize(settings);
    tz.initializeTimeZones();
  }

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        Constants.channelId,
        Constants.channelName,
        channelDescription: Constants.channelDescription,
        importance: Importance.max,
        playSound: true,
        ongoing: true,
        styleInformation: BigTextStyleInformation(''),
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  static Future _showScheduledNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required DateTime scheduledDate,
  }) async {
    if (DateTime.now().isBefore(scheduledDate) ||
        DateTime.now().isAtSameMomentAs(scheduledDate)) {
      _notifications.zonedSchedule(
          id,
          title,
          body,
          tz.TZDateTime.from(
            scheduledDate,
            tz.local,
          ),
          await _notificationDetails(),
          payload: payload,
          androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime);
    }
  }

  static void cancelNotifications() => _notifications.cancelAll();
}
