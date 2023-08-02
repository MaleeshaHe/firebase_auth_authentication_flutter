import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_authentication_flutter/models/error_check_model.dart';
import 'package:flutter/material.dart';

class CheckingProvider extends ChangeNotifier {
  CollectionReference checking =
      FirebaseFirestore.instance.collection("Checking");

  Future<List<ErrorCheck>> fetchChecking() async {
    QuerySnapshot snapshot = await checking.get();
    List<ErrorCheck> errorChecks = [];
    for (var e in snapshot.docs) {
      ErrorCheck errorCheck =
          ErrorCheck.fromJson(e.data() as Map<String, dynamic>);
      errorChecks.add(errorCheck);
    }
    return errorChecks;
  }
}
