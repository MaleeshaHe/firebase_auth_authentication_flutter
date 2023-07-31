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

  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBlack,
      appBar: AppBar(
        backgroundColor: bgBlack,
        title: const Text("SIGN IN"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 10),
          child: Column(
            children: [
              const Text(
                description,
                style: descriptionStyle,
              ),
              Center(
                child: Image.asset(
                  "assets/images/man.png",
                  height: 200,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) =>
                          value?.isEmpty == true ? "Enter a valid email" : null,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    TextFormField(
                      validator: (value) =>
                          value!.length < 6 ? "Enter a valid password" : null,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Login with social accounts",
                      style: descriptionStyle,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Image.asset(
                        "assets/images/google.png",
                        height: 50,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Do not have an account ? ",
                          style: descriptionStyle,
                        ),
                        GestureDetector(
                          child: const Text(
                            "REGISTOR",
                            style: TextStyle(
                              color: mainBlue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
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