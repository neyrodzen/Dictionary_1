import 'package:flutter/material.dart';
import 'parent_list.dart';
import '../model/textfield_model.dart';

class SearchList extends StatefulWidget implements ParentList {
  @override
  State<SearchList> createState() => _SearchListState();

  @override
  Future<Widget> makeSome() {
    throw UnimplementedError();
  }
}

class _SearchListState extends State<SearchList> {
  TextEditingController textcontroller = TextEditingController();
  Widget favoritButton = Icon(
    Icons.favorite_border,
    color: Colors.red,
  );
  bool flag = false;
  String text = ' ';

  Future<void> onTapSearch() async {
    SearchModelProvider.read(context)?.model.key = textcontroller.text;
    text = await SearchModelProvider.read(context)?.model.getTranslate() ??
        'error';
    flag = await SearchModelProvider.watch(context)
            ?.model
            .database
            .contains(textcontroller.text) ??
        false;
    flag == true
        ? favoritButton = Icon(
            Icons.favorite,
            color: Colors.red,
          )
        : favoritButton = Icon(
            Icons.favorite_border,
            color: Colors.red,
          );
    setState(() {});
  }

  Future<void> pressFavorit() async {
    if (flag == false) {
      await SearchModelProvider.read(context)
          ?.model
          .database
          .put(textcontroller.text, text);
    } else {
      await SearchModelProvider.read(context)
          ?.model
          .database
          .delete(textcontroller.text);
    }
    flag = await SearchModelProvider.watch(context)
            ?.model
            .database
            .contains(textcontroller.text) ??
        false;
    flag == true
        ? favoritButton = Icon(Icons.favorite,color: Colors.red,)
        : favoritButton = Icon(Icons.favorite_border,color: Colors.red,);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            SizedBox(
              height: 100,
            ),
            ElevatedButton(onPressed: onTapSearch, child: Text('Search')),
            SizedBox(
              height: 10,
            ),
          ],
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 350, maxWidth: 350),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 0.5,
                ),
              ],
              color: Color.fromARGB(255, 230, 230, 230),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  TextField(
                    controller: textcontroller,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          text,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      IconButton(onPressed: pressFavorit, icon: favoritButton)
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
