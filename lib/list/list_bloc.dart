import 'dart:async';
import 'package:rxdart/subjects.dart';

import '../common/models/simplelist.dart';

class NewListItem {
  final String text;

  NewListItem(this.text);
}

class ListBloc {
  final SimpleList list = new SimpleList();

  final _itemList = BehaviorSubject<List<String>>();
  Stream<List<String>> get getItemList => _itemList.stream;

  final _updatedItem = BehaviorSubject<String>();
  Stream<String> get getItem => _updatedItem.stream;
  Function(String) get setItem => _updatedItem.sink.add;

  final _newListItem = StreamController<NewListItem>();
  Sink<NewListItem> get newListItem => _newListItem.sink;

  ListBloc() {
    _newListItem.stream.listen((input) {
      list.simpleList.add(input.text);
      _itemList.add(list.simpleList);
    });
  }

  void dispose() {
    _itemList.close();
    _updatedItem.close();
  }
}
