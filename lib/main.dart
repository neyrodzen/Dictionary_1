import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'home_page/home_page.dart';
import 'home_page/model/model.dart';
import 'home_page/model/model_provider.dart';
import 'setting_page/setting_page.dart';

void main() async{

  await Hive.initFlutter();
  runApp(MyApp());
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
