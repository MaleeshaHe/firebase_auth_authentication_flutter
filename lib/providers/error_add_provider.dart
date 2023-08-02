// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_authentication_flutter/models/error_model.dart';
import 'package:firebase_auth_authentication_flutter/utils/custom_dialog.dart';
import 'package:flutter/material.dart';

class ErrorAddProvider extends ChangeNotifier {
  final TextEditingController _errorNameController = TextEditingController();
  final TextEditingController _errorTypeController = TextEditingController();

  CollectionReference error = FirebaseFirestore.instance.collection("Errors");

  TextEditingController get errorNameController => _errorNameController;
  TextEditingController get errorTypeController => _errorTypeController;

  Future<void> addError(context) async {
    if (_errorNameController.text.isEmpty) {
      CustomDialog.toast(context, "Insert Error Name");
    } else if (_errorTypeController.text.isEmpty) {
      CustomDialog.toast(context, "Insert Error Type");
    } else {
      CustomDialog.show(context);
      DocumentReference errorDoc = await error.add({
        "errorName": _errorNameController.text,
        "errorType": _errorTypeController.text,
      }).then(
        (value) {
          error.doc(value.id).update({"errorId": value.id});
          CustomDialog.toast(context, "Error Added");
          CustomDialog.dismiss(context);
          _errorNameController.clear();
          _errorTypeController.clear();
          notifyListeners();
          CustomDialog.dismiss(context);
          return value;
        },
      );
    }
  }

  Future<List<Errorm>> fetchErrors() async {
    QuerySnapshot snapshot = await error.get();
    List<Errorm> errors = [];
    for (var e in snapshot.docs) {
      Errorm error = Errorm.fromJson(e.data() as Map<String, dynamic>);
      errors.add(error);
    }
    return errors;
  }
}
