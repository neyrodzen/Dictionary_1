import 'package:flutter/material.dart';

abstract class ParentList {
}

class FavoritesList extends StatelessWidget implements ParentList {

  
  @override
  Widget build(BuildContext context) {
    return Text('favorites');
  }
}

class OfflineList extends StatelessWidget implements ParentList {
  @override
  Widget build(BuildContext context) {
    return Text('List');
  }
}

class ErrorList extends StatelessWidget implements ParentList {
 @override
  Widget build(BuildContext context) {
    return Text('Error ');
  }
}

