import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'api_client/api_client.dart';

class TextFieldModel extends ChangeNotifier {
  String enterText = '';
  String showText = '';

  // Future <String> getTranslate() async {
  Future<String?> getTranslate() async{
    ApiClient apiClient = ApiClient();
    String? translate = await apiClient.getHttp(enterText);
    return translate;
  }
}

class SearchModelProvider extends InheritedNotifier {
  SearchModelProvider({
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
