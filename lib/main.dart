import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'home_page/home_page.dart';
import 'home_page/model/model.dart';
import 'home_page/model/model_provider.dart';
import 'setting_page/setting_page.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
/////////////
@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // handle action
}

//////////////
void main() async{
/////////////////////
  await Hive.initFlutter();
  runApp(MyApp());
//////////////////////////////////////
// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
// // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
// const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('app_icon');
// //////////////////

// final InitializationSettings initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//     );
// /////////////////////
// await flutterLocalNotificationsPlugin.initialize(
//     initializationSettings,
// );
// /////////////////
// const AndroidNotificationDetails androidNotificationDetails =
//     AndroidNotificationDetails('your channel id', 'your channel name',
//         channelDescription: 'your channel description',
//         importance: Importance.max,
//         priority: Priority.high,
//         ticker: 'ticker');
// const NotificationDetails notificationDetails =
//     NotificationDetails(android: androidNotificationDetails);
// await flutterLocalNotificationsPlugin.show(
//     0, 'plain title', 'plain body', notificationDetails,
//     payload: 'item x');

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ModelOfPage model = ModelOfPage(0);

  // This widget is the root of your application.
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dictionary',
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
        onPrimary: Colors.white70,
      )),
      home: ModelProvider(model: model, child: const HomePage()),
      routes: {
        //'/': (context) => HomePage(),
        '/settings_page': (context) => SettingsPage()
      },
      // initialRoute: '/'
    );
  }
}
