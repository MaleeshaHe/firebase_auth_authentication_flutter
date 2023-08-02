// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_authentication_flutter/models/machine_model.dart';
import 'package:firebase_auth_authentication_flutter/utils/custom_dialog.dart';
import 'package:flutter/widgets.dart';

class MachineAddProvider extends ChangeNotifier {
  final TextEditingController _machineNameController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _serialNoController = TextEditingController();
  final TextEditingController _serviceBarcodeController =
      TextEditingController();
  final TextEditingController _barCodeController = TextEditingController();
  final TextEditingController _farCodeController = TextEditingController();

  CollectionReference machine =
      FirebaseFirestore.instance.collection("Machines");

  TextEditingController get machineNameController => _machineNameController;
  TextEditingController get modelController => _modelController;
  TextEditingController get serialNoController => _serialNoController;
  TextEditingController get serviceBarcodeController =>
      _serviceBarcodeController;
  TextEditingController get barCodeController => _barCodeController;
  TextEditingController get farCodeController => _farCodeController;

  Future<void> addMachine(context) async {
    if (_machineNameController.text.isEmpty) {
      CustomDialog.toast(context, "Insert Machine Name");
    } else if (_modelController.text.isEmpty) {
      CustomDialog.toast(context, "Insert Machine Model");
    } else if (_serialNoController.text.isEmpty) {
      CustomDialog.toast(context, "Insert Serial No");
    } else if (_serviceBarcodeController.text.isEmpty) {
      CustomDialog.toast(context, "Insert Service Barcode");
    } else if (_barCodeController.text.isEmpty) {
      CustomDialog.toast(context, "Insert Machine Barcode");
    } else if (_farCodeController.text.isEmpty) {
      CustomDialog.toast(context, "Insert FAR Code");
    } else {
      CustomDialog.show(context);
      DocumentReference machineDoc = await machine.add({
        "machine_name": _machineNameController.text,
        "model": _modelController.text,
        "serial_no": _serialNoController.text,
        "service_barcode": _serviceBarcodeController.text,
        "barcode": _barCodeController.text,
        "far_code": _farCodeController.text,
      }).then(
        (value) {
          machine.doc(value.id).update({"machine_id": value.id});
          CustomDialog.toast(context, "Machine Added");
          CustomDialog.dismiss(context);
          _barCodeController.clear();
          _farCodeController.clear();
          _machineNameController.clear();
          _modelController.clear();
          _serialNoController.clear();
          _serviceBarcodeController.clear();
          notifyListeners();
          CustomDialog.dismiss(context);
          return value;
        },
      );
    }
  }

  Future<List<Machine>> fetchMachine() async {
    QuerySnapshot snapshot = await machine.get();
    List<Machine> machines = [];
    for (var e in snapshot.docs) {
      Machine machine = Machine.fromJson(e.data() as Map<String, dynamic>);
      machines.add(machine);
    }
    return machines;
  }
}
