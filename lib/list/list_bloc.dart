import 'dart:async';
import 'package:rxdart/subjects.dart';

class ListBloc {
  final BehaviorSubject<List<String>> _item = BehaviorSubject<List<String>>(seedValue: ['test 1', 'test 2']);

  Stream<List<String>> get item => _item.stream;

  void dispose() {
    _item.close();
  }
}
