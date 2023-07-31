import 'package:firebase_auth_authentication_flutter/constants/colors.dart';
import 'package:firebase_auth_authentication_flutter/constants/description.dart';
import 'package:firebase_auth_authentication_flutter/constants/styles.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //Ref for the AuthServices Class
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBlack,
      appBar: AppBar(
        backgroundColor: bgBlack,
        title: const Text("SIGN IN"),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15.0, right: 10),
        child: Column(
          children: [
            Text(
              description,
              style: descriptionStyle,
            ),
            Image.asset("assets/images/man.png"),
          ],
        ),
      ),
    );
  }
}



// ElevatedButton(
//           onPressed: () async {
//             dynamic result = await _auth.signInAnonymously();
//             if (result == null) {
//               Logger().e("Error in sign in Anonymosly");
//             } else {
//               Logger().i("Sign in Anonymosly");
//               Logger().i(result.uid);
//             }
//           },
//           child: const Text("Sign In Anonymously"),
//         ),