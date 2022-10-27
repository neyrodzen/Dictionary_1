import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DataBase {
  bool isFavorit = false;

  Future<void> put(String key, String value) async {
    var box = await Hive.openBox<String>('DictionaryBox');
    await box.put(key, value);
    await box.close();
  }

  Future<String> get(String key) async {
    var box = await Hive.openBox<String>('DictionaryBox');
    final value = box.get(key) as String;
    await box.close();

    return value;
  }

  Future<void> delete(String key) async {
    var box = await Hive.openBox<String>('DictionaryBox');
    await box.delete(key);
    await box.close();
  }

  Future<bool> contains(String key) async {
    var box = await Hive.openBox<String>('DictionaryBox');
    bool flag = box.containsKey(key);
    await box.close();
    return flag;
  }

  Future<List<Widget>> getList() async {
    var box = await Hive.openBox<String>('DictionaryBox');
    var map = box.toMap();
    var list = <Widget>[];
    map.forEach((key, value) {
      list.add(Column(
        children: [
          Row(
            children: [
              Expanded(flex: 1,child: Container(),),
              Expanded(flex: 4,child: Text('$key',style: TextStyle(fontSize: 20),),),
              Expanded(flex: 4,child: Text(value,style: TextStyle(fontSize: 20)),),
            ],
          ),
          SizedBox(height: 10,)
        ],
      ));
    });
    await box.close();
    return list;
  }
}
