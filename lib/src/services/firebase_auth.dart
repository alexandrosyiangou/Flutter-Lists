import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth _firebaseAuth =FirebaseAuth.instance;

  Future<String> signup(String username, String password) async {
    FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(email:username, password:password);
    return user.uid;
  }

  Future<String> login(String username, String password) async {
    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(email:username, password:password);
    return user.uid;
  }
}
