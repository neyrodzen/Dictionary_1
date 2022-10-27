import 'package:flutter/material.dart';

abstract class ParentList {
  Future<Widget> makeSome();
}

class OfflineList extends StatelessWidget implements ParentList {
  @override
  Widget build(BuildContext context) {
    return Text('List');
  }
  
  @override
  Future<Widget> makeSome() {
    throw UnimplementedError();
  }
}

class ErrorList extends StatelessWidget implements ParentList {
  @override
  Widget build(BuildContext context) {
    return Text('Error ');
  }
  
  @override
  Future<Widget> makeSome() {
    throw UnimplementedError();
  }
}
