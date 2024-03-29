import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart'; import 'package:google_sign_in/google_sign_in.dart' as prefix0;

class User{
  User({@required this.uid, @required this.photoUrl, @required this.displayName, @required this.email} );
  final String uid;
  final String photoUrl;
  final String displayName;
  final String email;
}

abstract class AuthBase{
  Stream<User> get onAuthStateChanged;
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
    return User(
        uid: user.uid,
        displayName: user.displayName,
        photoUrl: user.photoUrl,
        email: user.email,
    );
  }

  @override
  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);
  }

  Future<User> currentUser() async{
    final user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);

  }

  Future<void> signOut() async{
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();

  }

  @override
  Future<User> signInWithGoogle() async{

    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleAccount = await googleSignIn.signIn();
     final GoogleSignInAuthentication googleSignInAuthentication =
      await googleAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,);
    final AuthResult authResult = await _firebaseAuth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;
    await _firebaseAuth.signInWithCredential(credential);

    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoUrl != null);
    assert(user.email != null);

    
// Only taking the first part of the name

// if (user.contains(" ")) {
//    user = user.substring(0, user.indexOf(" "));
// }
    
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