import 'package:flutter/material.dart';

import 'model/model_provider.dart';
import 'model/parent_list.dart';
import 'model/textfield_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexItem = 0;
  Widget? listWidget ;

  @override
  Widget build(BuildContext context) {
    void ontapSettings() {
      Navigator.of(context).pushNamed('/settings_page');
      setState(() {});
    }

    void onTapBottom(int index) {
      indexItem = index;
      ModelProvider.watch(context)?.model.indexBottomBar = index;
      ParentList list =
          ModelProvider.watch(context)?.model.factoryList() ?? ErrorList();
     
      listWidget = list as Widget;
      setState(() {});
    }

  TextFieldModel model = TextFieldModel();

    return Scaffold(
      // floatingActionButton:,
      appBar: AppBar(
          actions: [
            ElevatedButton(
              onPressed: ontapSettings,
              child: Icon(Icons.settings),
            )
          ],
          title: Row(
            children: [
              Expanded(
                child: Text(
                  '   ',
                ),
              ),
            ],
          )),
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: double.infinity,
          minWidth: double.infinity,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 184, 148, 190),
            Color.fromARGB(255, 231, 201, 236)
          ])),
          child: SingleChildScrollView(
            child: SearchModelProvider(
              model: model,
              child: listWidget ?? Center(
                child: Text('Dictionary',
                style: TextStyle(
                  fontSize: 50,
                  fontStyle: FontStyle.italic,
                ),))    
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorits',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List ',
          ),
        ],
        backgroundColor: Color.fromARGB(255, 108, 30, 244),
        selectedItemColor: Colors.grey,
        onTap: onTapBottom,
        currentIndex: indexItem,
      ),
    );
  }
}
