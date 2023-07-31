import 'package:firebase_auth_authentication_flutter/constants/colors.dart';
import 'package:firebase_auth_authentication_flutter/constants/description.dart';
import 'package:firebase_auth_authentication_flutter/constants/styles.dart';
import 'package:firebase_auth_authentication_flutter/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SignIn extends StatefulWidget {
  final Function toggle;

  SignIn({required this.toggle, super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //Ref for the AuthServices Class
  final AuthServices _auth = AuthServices();

  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";
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
                  height: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: textInputDecoration,
                        validator: (value) => value?.isEmpty == true
                            ? "Enter a valid email"
                            : null,
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration:
                            textInputDecoration.copyWith(hintText: "Password"),
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
                      Text(
                        error,
                        style: descriptionStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const Text(
                        "Login with social accounts",
                        style: descriptionStyle,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Image.asset(
                            "assets/images/google.png",
                            height: 50,
                          ),
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
                            onTap: () {
                              widget.toggle();
                            },
                            child: const Text(
                              "REGISTER",
                              style: TextStyle(
                                color: mainBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          dynamic result = await _auth
                              .signInUsingEmailAndPassword(email, password);

                          if (result == null) {
                            setState(() {
                              error = "Could not signin with those credentials";
                            });
                          } else {}
                        },
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: bgBlack,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: mainYellow, width: 2),
                          ),
                          child: const Center(
                            child: Text(
                              "LOG IN",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          dynamic result = await _auth.signInAnonymously();
                          if (result == null) {
                            Logger().e("Error in sign in Anonymosly");
                          } else {
                            Logger().i("Sign in Anonymosly");
                            Logger().i(result.uid);
                          }
                        },
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: bgBlack,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: mainBlue, width: 2),
                          ),
                          child: const Center(
                            child: Text(
                              "LOG IN AS GUEST",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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