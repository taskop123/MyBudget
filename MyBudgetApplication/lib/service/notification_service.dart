import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_budget_application/model/expense.dart';
import 'package:my_budget_application/model/user.dart';
import 'package:my_budget_application/service/expenses_service.dart';
import 'package:my_budget_application/service/firebase/users_repository.dart';
import 'package:timezone/data/latest.dart' as tz;

import '../util/constants.dart';

/// A service used for displaying and scheduling notifications.
class NotificationService {
  /// The title of the notifications.
  static const String notificationTitle = Constants.applicationTitle;

  /// The body/payload of the notifications.
  static const String notificationPayload = Constants.notificationTitle;

  /// An instance of the [FlutterLocalNotificationsPlugin]
  /// used for displaying and scheduling notifications on the user's device.
  static final _notifications = FlutterLocalNotificationsPlugin();

  /// The number of notifications the user has received
  /// on the currently opened device state.
  static var notificationCounter = 0;

  /// Initializes the android and IOS settings to enable
  /// the user to receive notifications on his device.
  ///
  static init() {
    const android = AndroidInitializationSettings(Constants.launcherUrl);
    const ios = IOSInitializationSettings();
    const settings = InitializationSettings(android: android, iOS: ios);

    _notifications.initialize(settings);
    tz.initializeTimeZones();
  }

  /// Constructs a [NotificationDetails] object consisting of
  /// the details about the specific notification being sent.
  ///
  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        Constants.channelId,
        Constants.channelName,
        channelDescription: Constants.channelDescription,
        importance: Importance.max,
        playSound: true,
        ongoing: true,
        styleInformation: BigTextStyleInformation(Constants.blankString),
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  /// Checks whether the monthly and/or yearly notifications
  /// for the currently logged in user should be displayed, and does so,
  /// if the condition is true based on the specified information
  /// for [_expenses], [user], [_currentUser] and [context].
  ///
  static Future toggleExpenseNotifications(List<Expense> _expenses, User? user,
      CustomUser _currentUser, BuildContext context) async {
    if (user != null) {
      var profileCreationTime = user.metadata.creationTime;
      if (profileCreationTime != null) {
        await _showMonthlyNotification(
            _expenses, _currentUser, profileCreationTime);
        await _showYearlyNotification(
            _expenses, _currentUser, profileCreationTime);
      }
    }
  }

  /// Shows the yearly notifications for the [_currentUser],
  /// based on his [_expenses] and the [creationDateMonth].
  ///
  static Future _showYearlyNotification(List<Expense> _expenses,
      CustomUser _currentUser, DateTime creationDateMonth) async {
    var timeNow = DateTime.now();
    if (creationDateMonth.year < timeNow.year &&
        _currentUser.yearlyNotificationsEnabled) {
      var yearlyNotificationEntry = '${timeNow.year - 1}';
      if (!_currentUser.yearlyNotifications.contains(yearlyNotificationEntry)) {
        double yearlySpending =
            ExpenseService.yearlySpending(_expenses, timeNow.year);
        double monthlyIncome = (_currentUser.monthlyIncome != null)
            ? double.parse(_currentUser.monthlyIncome!
                .replaceAll(Constants.lettersRegex, Constants.blankString))
            : 0.0;

        _showNotification(
            yearlySpending, monthlyIncome * 12.0, Constants.yearPlaceholder);
        _currentUser.yearlyNotifications.add(yearlyNotificationEntry);
        UserRepository.updateUserProfile(
            _currentUser.updateProfileEnabled,
            _currentUser.id,
            _currentUser.profilePicture,
            _currentUser.monthlyIncome,
            _currentUser.monthlyNotifications,
            _currentUser.yearlyNotifications,
            _currentUser.monthlyNotificationsEnabled,
            _currentUser.yearlyNotificationsEnabled,
            _currentUser.updateProfileEnabled,
            _currentUser.themeDarkEnabled);
      }
    }
  }

  /// Shows the monthly notifications for the [_currentUser],
  /// based on his [_expenses] and the [creationDateMonth].
  ///
  static Future _showMonthlyNotification(List<Expense> _expenses,
      CustomUser _currentUser, DateTime creationDateMonth) async {
    var timeNow = DateTime.now();
    if (creationDateMonth.month < timeNow.month &&
        _currentUser.monthlyNotificationsEnabled) {
      var monthlyNotificationEntry = '${timeNow.month - 1}-${timeNow.year}';
      if (!_currentUser.monthlyNotifications
          .contains(monthlyNotificationEntry)) {
        double monthlySpending = ExpenseService.monthlySpending(
            _expenses, timeNow.year, timeNow.month);
        double monthlyIncome = (_currentUser.monthlyIncome != null)
            ? double.parse(_currentUser.monthlyIncome!
                .replaceAll(Constants.lettersRegex, Constants.blankString))
            : 0.0;

        _showNotification(
            monthlySpending, monthlyIncome, Constants.monthPlaceholder);
        _currentUser.monthlyNotifications.add(monthlyNotificationEntry);
        UserRepository.updateUserProfile(
            _currentUser.updateProfileEnabled,
            _currentUser.id,
            _currentUser.profilePicture,
            _currentUser.monthlyIncome,
            _currentUser.monthlyNotifications,
            _currentUser.yearlyNotifications,
            _currentUser.monthlyNotificationsEnabled,
            _currentUser.yearlyNotificationsEnabled,
            _currentUser.updateProfileEnabled,
            _currentUser.themeDarkEnabled);
      }
    }
  }

  /// Shows a notification to the currently logged in user with
  /// a specific information regarding his [spending], [income],
  /// based on the [notificationType].
  ///
  static Future _showNotification(
      double spending, double income, String notificationType) async {
    String adviceMessage = (spending > income)
        ? Constants.negativeAdviceMessage
        : Constants.positiveAdviceMessage;

    _notifications.show(
      notificationCounter++,
      notificationTitle,
      'Your spending for the previous $notificationType was USD${spending.toStringAsFixed(2)}, '
      'and your income is USD${income.toStringAsFixed(2)}. $adviceMessage',
      await _notificationDetails(),
      payload: notificationPayload,
    );
  }

  /// Cancels all scheduled notifications on the device.
  ///
  static void cancelNotifications() => _notifications.cancelAll();
}
