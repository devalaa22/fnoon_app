import 'package:firebase_auth/firebase_auth.dart';



class AuthService {

  // ignore: unused_field
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //  User _userFromFirebaseUser(FirebaseUser user) {
  //   return user != null ? User(uid: user.uid) : null;
  // }
  // User _userFromFirebaseUser(FirebaseUser user){
  //   return user != null ? User(uid: user.uid): null;

  // }

  // sign in anon
  Future signInAnon() async {
    // try {
    //   AuthResult result = await _auth.signInAnonymously();
    //   FirebaseUser user = result.user;
    //   return user;
    // } catch (e) {
    //   print(e.toString());
    //   return null;
    // }
  }

  // sign in with email and password


  // register with email and password

  // sign out

}
