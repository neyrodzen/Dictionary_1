import 'package:flutter/material.dart';
import 'parent_list.dart';
import 'textfield_model.dart';

class SearchList extends StatefulWidget implements ParentList {
  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  TextEditingController textcontroller = TextEditingController();

  String? text = 'responce';
  Future<void> onTapSearch() async {
    SearchModelProvider.read(context)?.model.enterText = textcontroller.text;
    text = await SearchModelProvider.read(context)?.model.getTranslate();
    setState(() {
    });
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
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 149, 127, 188),
                  Color.fromARGB(255, 137, 106, 190),
                ],
              ),
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
                  Text(
                    text!,
                    style: TextStyle(fontSize: 20),
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
