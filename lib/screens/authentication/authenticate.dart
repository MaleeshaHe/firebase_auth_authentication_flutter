import 'package:firebase_auth_authentication_flutter/screens/authentication/login.dart';
import 'package:firebase_auth_authentication_flutter/screens/authentication/register.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool singinPage = true;

  void switchPages() {
    setState(() {
      singinPage != singinPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (singinPage == true) {
      return SignIn(toggle: switchPages);
    } else {
      return Register(toggle: switchPages);
    }
  }
}
