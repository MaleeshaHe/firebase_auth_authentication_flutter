import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_authentication_flutter/models/error_check_model.dart';
import 'package:flutter/material.dart';

class CheckingProvider extends ChangeNotifier {
  final TextEditingController _machineNameController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _serialNoController = TextEditingController();
  final TextEditingController _barCodeController = TextEditingController();
  final TextEditingController _farCodeController = TextEditingController();

  CollectionReference checking =
      FirebaseFirestore.instance.collection("Checking");

  TextEditingController get machineNameController => _machineNameController;
  TextEditingController get modelController => _modelController;
  TextEditingController get serialNoController => _serialNoController;
  TextEditingController get barCodeController => _barCodeController;
  TextEditingController get farCodeController => _farCodeController;

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
