import 'package:cloud_firestore/cloud_firestore.dart';

import './firestore_service.dart';
import './firebase_auth.dart';

class Repository {
  final _firestoreProvider = FirestoreService();
  final _firebaseAuthProvider =FirebaseAuthService();

  Stream<QuerySnapshot> fetchAllLists() => _firestoreProvider.fetchAllLists();

  Future<void> addNewList(String listName) => _firestoreProvider.addNewList(listName);

  Future<String> signup(String username, String password) async => await _firebaseAuthProvider.signup(username, password);

  Future<String> login(String username, String password) async => await _firebaseAuthProvider.login(username, password);
}
