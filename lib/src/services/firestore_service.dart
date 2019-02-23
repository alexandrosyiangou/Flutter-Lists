import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  Firestore _firestore = Firestore.instance;

  //Getters
  Stream<QuerySnapshot> fetchAllLists() {
    return _firestore.collection("Lists").snapshots();
  }

  Future<void> addNewList(String listName) {
    return _firestore
      .collection("Lists")
      .document()
      .setData({'listTitle': listName});
  }

  //Setters
  //   Future<void> registerUser(String email, String password) async {
  //   return _firestore
  //       .collection("users")
  //       .document(email)
  //       .setData({'email': email, 'password': password, 'goalAdded': false});
  // }

  // Future<void> addNewList(NewList newList) {
  //   return _firestore
  //     .collection("Lists")
  //     .document()
  //     .setData(newList);
  // }
}
