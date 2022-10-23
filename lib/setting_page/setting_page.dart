import 'package:flutter/material.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Text(''),
            )
          ],
          title: Center(
            child: Text('Settings',
            ),
          )),
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: double.infinity,
          minWidth: double.infinity,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors:  [Color.fromARGB(255, 139, 111, 186), Color.fromARGB(255, 184, 148, 190)])),
          child: Container(),
        ),
      ),
    );
  }
}
