import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class User{
  User({@required this.uid});
  final String uid;
}

abstract class AuthBase{
  Future<User> currentUser();
  Future<void> signOut();
  Future<User> signInWithGoogle();

}

class Auth implements AuthBase{

  final _firebaseAuth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user){
    if (user == null){
      return null;
    }
    return User(uid: user.uid);
  }

  Future<User> currentUser() async{
    final user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);

  }

  Future<void> signOut() async{
    await _firebaseAuth.signOut();

  }

  @override
  Future<User> signInWithGoogle() async{
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleAccount = await googleSignIn.signIn();
    if(googleSignIn != null){
      GoogleSignInAuthentication googleAuth =
        await googleAccount.authentication;
      if(googleAuth.accessToken != null && googleAuth.idToken != null){
      final authResult = await _firebaseAuth.signInWithCredential(
        GoogleAuthProvider.getCredential(
          idToken: googleAuth.idToken , 
          accessToken:googleAuth.accessToken)
      );
      return _userFromFirebase(authResult.user);
      } else{
         throw PlatformException(
        code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
        message: 'Missing Google Auth Token',
      );

      }
    } else{
      throw PlatformException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'SignIn aborted by user'
      );
    }
  }
}