import 'package:rxdart/rxdart.dart';
import '../services/repository.dart';

class AddNewListBloc {

  final _repository = Repository();

  final _listName = BehaviorSubject<String>();

  Observable<String> get listNameObservable => _listName.stream;

  Function(String) get changeListName => _listName.sink.add;

  void addNewList() {
    _repository.addNewList(_listName.value);
  }

  void dispose() async {
    await _listName.drain();
    _listName.close();
  }
}
