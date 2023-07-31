import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_authentication_flutter/models/user_model.dart';
import 'package:logger/logger.dart';

class AuthServices {
  //firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Creating a user from firevbase user with uid
  UserModel? _userWithFirebaseUserUid(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  //Create the stream for checking the auth changes in the user
  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userWithFirebaseUserUid);
  }

  //Sign in anonymous
  Future signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userWithFirebaseUserUid(user);
    } catch (err) {
      Logger().i(err.toString());
      return null;
    }
  }

  //register using email and password
  //sign in using email and password
  //sign in using gmail
  //sign out
}
