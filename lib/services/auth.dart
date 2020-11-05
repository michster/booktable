import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future registerWithEMail(String email, String password) async {
    try {
        await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      String error = e.toString();
      if(e.toString().contains("email != null")) {
        error = "Ohne E-Mail kannst du dich nicht registrieren!";
      }
      throw(error);
    }
  }
}