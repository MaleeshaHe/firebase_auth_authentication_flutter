import 'package:firebase_auth_authentication_flutter/constants/colors.dart';
import 'package:firebase_auth_authentication_flutter/constants/description.dart';
import 'package:firebase_auth_authentication_flutter/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bgBlack,
        appBar: AppBar(
          backgroundColor: bgBlack,
          actions: [
            IconButton(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  "Home",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textLight,
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Center(
                  child: Image.asset(
                    "assets/images/man.png",
                    height: 150,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
