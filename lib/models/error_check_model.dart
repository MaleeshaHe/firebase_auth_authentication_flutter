import 'package:firebase_auth_authentication_flutter/models/error_model.dart';

class ErrorCheck {
  String? checkID;
  String? checkDate;
  String? machineId;
  String? lineNo;
  Map<String, dynamic>? errorList;

  ErrorCheck({
    required this.checkID,
    required this.checkDate,
    required this.machineId,
    required this.lineNo,
    required this.errorList,
  });

  factory ErrorCheck.fromJson(Map<String, dynamic> map) {
    return ErrorCheck(
      checkID: map["checkID"],
      checkDate: map["checkDate"],
      machineId: map["machineId"],
      lineNo: map["lineNo"],
      errorList: Map<String, dynamic>.from(map["errorList"] ?? []),
    );
  }
}
