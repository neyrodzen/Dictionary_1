import 'package:flutter/material.dart';

import '../../data_base/data_base.dart';
import '../api_client/api_client.dart';

class TextFieldModel extends ChangeNotifier {
  String key = '';
  String value = '';
  DataBase database = DataBase();

  Future<String> getTranslate() async {
    ApiClient apiClient = ApiClient();
    String translate = await apiClient.getHttp(key) ?? 'error!!!';
    return translate;
  }
@override
  void notifyListeners() {
  }
}

class SearchModelProvider extends InheritedNotifier {
  const SearchModelProvider({
    super.key,
    required this.model,
    required super.child,
  }) : super(
          notifier: model,
        );
  final TextFieldModel model;

  static SearchModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SearchModelProvider>();
  }

  static SearchModelProvider? read(BuildContext context) {
    return context
        .getElementForInheritedWidgetOfExactType<SearchModelProvider>()
        ?.widget as SearchModelProvider;
  }
}
