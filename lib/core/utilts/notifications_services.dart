import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone_updated_gradle/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../features/home_screen/presentation/views/view/notification_page.dart';

class NotificationsServices {
  static onTap(NotificationResponse response) {


    if(response.payload=='Theme Changed'){
      if (kDebugMode) {
        print(response.id);
      }
      if (kDebugMode) {
        print(response.payload);
      }
    }
    else{
      Get.to(NotificationPage(label: response.payload!));
    }

  }

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin(); //

  Future<void> initializeNotification() async {
    configrationTimeZone();
    // this is for latest iOS settings
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
            requestSoundPermission: true,
            requestBadgePermission: true,
            requestAlertPermission: true,
            onDidReceiveLocalNotification: (id, title, body, payload) {});

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('download');

    final InitializationSettings initializationSettings =
        InitializationSettings(
      iOS: initializationSettingsIOS,
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onTap,
        onDidReceiveBackgroundNotificationResponse: onTap);
  }

  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    Get.dialog(const Text('welcome to notificatio'));
  }

  Future selectNotification(String? payload) async {
    if (payload != null) {
      if (kDebugMode) {
        print('notification payload: $payload');
      }
    } else {
      if (kDebugMode) {
        if (kDebugMode) {
          if (kDebugMode) {
            print("Notification Done");
          }
        }
      }
    }
    Get.to(() => NotificationPage(label: payload!));
  }

  void requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future<void> displayNotification(
      {required String title, required String body,}) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails('Channel_id', 'Channel_title',
            importance: Importance.max,
            priority: Priority.high,
            icon: 'download',
            channelShowBadge: true,
            color: Colors.red,
            largeIcon: DrawableResourceAndroidBitmap('download'));
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails,payload: title);
  }

  Future scheduledNotification({
    int id = 0,
    String? title,
    String? body,
    int? hour,
    int? minuit,
  }) async {
    return await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        convertTime(hour!, minuit!),
        //tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        const NotificationDetails(
            android: AndroidNotificationDetails('Channel_id', 'Channel_title',
                importance: Importance.max,
                priority: Priority.high,
                icon: 'download',
                largeIcon: DrawableResourceAndroidBitmap('download'))),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: "$title|" + "$body|");
  }

  tz.TZDateTime convertTime(int hour, int minuit) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minuit);
    // print(scheduleDate);
    return scheduleDate;
  }

  Future<void> configrationTimeZone() async {
    tz.initializeTimeZones();
    final String timeZone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZone));
  }
}
