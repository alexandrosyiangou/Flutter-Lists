import 'package:rxdart/rxdart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../services/repository.dart';

class ListBloc {
  final _repository = Repository();

  final _lists = BehaviorSubject<List<String>>();
  Observable<List<String>> get lists => _lists.stream;

  final _username = BehaviorSubject<String>();
  Observable<String> get usernameObservable => _username.stream;
  Function(String) get changeUsername => _username.sink.add;

  final _password = BehaviorSubject<String>();
  Observable<String> get passwordObservable => _password.stream;
  Function(String) get changePassword => _password.sink.add;

  Stream<QuerySnapshot> fetchAllLists() => 
    _repository.fetchAllLists();
    // .map((alllists) => 
    //   alllists.documents.map((list) => list).toList());

  Future<String> signup() async {
    return await _repository.signup(_username.value, _password.value);
  }

  Future<String> login() async {
    return await _repository.login(_username.value, _password.value);
  }

  //Utils
  // Convert map to 
  List mapToList({DocumentSnapshot doc, List<DocumentSnapshot> docList}) {
    List<String> allLists = [];
    docList.forEach((document) {
      String listName = document.data["listTitle"];
      allLists.add(listName);
    });
    return allLists;
  }
    

  void dispose() async {
    await _lists.drain();
    _lists.close();
    await _username.drain();
    _username.close();
    await _password.drain();
    _password.close();
  }
}
