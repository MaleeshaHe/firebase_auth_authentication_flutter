import 'package:firebase_auth_authentication_flutter/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //Ref for the AuthServices Class
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SIGN IN"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            dynamic result = await _auth.signInAnonymously();
            if (result == null) {
              Logger().e("Error in sign in Anonymosly");
            } else {
              Logger().i("Sign in Anonymosly");
            }
          },
          child: const Text("Sign In Anonymously"),
        ),
      ),
    );
  }
}
