import 'package:firebase_auth_authentication_flutter/providers/machine_add_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/custom_text_field.dart';

class AddMachinePage extends StatefulWidget {
  const AddMachinePage({super.key});

  @override
  State<AddMachinePage> createState() => _AddMachinePageState();
}

class _AddMachinePageState extends State<AddMachinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new machine"),
      ),
      body: Consumer<MachineAddProvider>(
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  lable: "Machine Mame",
                  prefixIcon: Icons.now_widgets_outlined,
                  controller: value.machineNameController,
                ),
                CustomTextField(
                  lable: "Model",
                  prefixIcon: Icons.description_outlined,
                  controller: value.modelController,
                ),
                CustomTextField(
                  lable: "Serial No",
                  prefixIcon: Icons.price_change_outlined,
                  controller: value.serialNoController,
                  inputType: TextInputType.number,
                ),
                CustomTextField(
                  lable: "Service Barcode",
                  prefixIcon: Icons.type_specimen_outlined,
                  controller: value.serviceBarcodeController,
                ),
                CustomTextField(
                  lable: "Barcode",
                  prefixIcon: Icons.type_specimen_outlined,
                  controller: value.barCodeController,
                ),
                CustomTextField(
                  lable: "FAR Code",
                  prefixIcon: Icons.type_specimen_outlined,
                  controller: value.farCodeController,
                ),
                ElevatedButton(
                  onPressed: () {
                    value.addMachine(context);
                  },
                  child: const Text("Add Machine"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
