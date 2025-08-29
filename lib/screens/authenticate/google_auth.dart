import 'package:google_sign_in/google_sign_in.dart';
class GoogleAuth{
  static final _googleSignin= GoogleSignIn(scopes: ['https://mail.google.com/']);
  static Future<GoogleSignInAccount?> signIn() async{
    if(await _googleSignin.isSignedIn()){
      return _googleSignin.currentUser;
    }else{
        return  await _googleSignin.signIn();
    }
    
  }
  static Future signOut()=>_googleSignin.signOut();


}
