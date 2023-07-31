import 'package:firebase_auth_authentication_flutter/models/user_model.dart';
import 'package:firebase_auth_authentication_flutter/screens/authentication/authenticate.dart';
import 'package:firebase_auth_authentication_flutter/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    if (user == null) {
      return const Authenticate();
    } else {
      return const Home();
    }
  }
}
