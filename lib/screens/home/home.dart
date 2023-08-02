import 'package:firebase_auth_authentication_flutter/constants/colors.dart';
import 'package:firebase_auth_authentication_flutter/constants/description.dart';
import 'package:firebase_auth_authentication_flutter/screens/home/checking/checking_add.dart';
import 'package:firebase_auth_authentication_flutter/screens/home/errors/add_error.dart';
import 'package:firebase_auth_authentication_flutter/screens/home/errors/error_check.dart';
import 'package:firebase_auth_authentication_flutter/screens/home/errors/view_error.dart';
import 'package:firebase_auth_authentication_flutter/screens/home/machine/add_machines.dart';
import 'package:firebase_auth_authentication_flutter/services/auth.dart';
import 'package:flutter/material.dart';

import 'checking/checking_view.dart';
import 'machine/view_machines.dart';

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
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddMachinePage(),
                      ),
                    );
                  },
                  child: const Text("Add Machine"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ViewMachinePage(),
                      ),
                    );
                  },
                  child: const Text("View Machine"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddErrorPage(),
                      ),
                    );
                  },
                  child: const Text("Add Error"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ViewErrorPage(),
                      ),
                    );
                  },
                  child: const Text("View Error"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CheckError(),
                      ),
                    );
                  },
                  child: const Text("Checking"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChekingViewPage(),
                      ),
                    );
                  },
                  child: const Text("Checking"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CheckingAddPage(),
                      ),
                    );
                  },
                  child: const Text("Create Checking"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
