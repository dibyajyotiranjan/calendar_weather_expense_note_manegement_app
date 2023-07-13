import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class notification {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings _androidInitializationSettings =
  AndroidInitializationSettings(
      "icon"); //logo has always appier on the android/src/main/res/drawable/logo.png

  void initilizationSetting() async {
    InitializationSettings initializationSettings = InitializationSettings(
      android: _androidInitializationSettings,
    );
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void sendNoti(title, body) async {
    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('channelId', 'channelName',
        importance: Importance.max, priority: Priority.high);
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    await _flutterLocalNotificationsPlugin.show(
        0, title, body, notificationDetails);
  }

  void schduleNoti() async {
    AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('channelId', 'channelName',
        importance: Importance.max, priority: Priority.high);
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    await _flutterLocalNotificationsPlugin.periodicallyShow(
        0,
        "ଆମର ଚେଷ୍ଟା ଏଵଂ ଲକ୍ଷ୍ୟ ତୁମକୁ ସଠିକ୍ ତଥ୍ୟ ସଠିକ ସମୟରେ ପହଞ୍ଚାଇବା……",
        "ଆଜିର ସବିଶେଷ ବିବରଣୀ ପାଆନ୍ତୁ ଏହି କଲେଣ୍ଡର କୁ OPEN କରି 'ତାହା ସହ' ପାଣିପାଗର ସୂଚନା ଏବଂ ଆଜିର ଖର୍ଚ୍ଚର ହିସାବ ଓ ନୋଟ୍ ପ୍ରସ୍ତୁତ କରନ୍ତୁ FREE ରେ",
        RepeatInterval.daily,
        notificationDetails,
        androidAllowWhileIdle: true);
  }

  void stopnoti() async {
    _flutterLocalNotificationsPlugin.cancelAll();
  }
}
