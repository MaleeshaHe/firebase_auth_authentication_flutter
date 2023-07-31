import 'package:firebase_auth_authentication_flutter/constants/description.dart';
import 'package:firebase_auth_authentication_flutter/services/auth.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/styles.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices _auth = AuthServices();

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
                          onTap: () {},
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
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {},
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
                      onTap: () {},
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
