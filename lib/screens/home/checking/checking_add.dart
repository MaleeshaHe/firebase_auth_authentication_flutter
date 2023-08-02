import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_authentication_flutter/components/custom_text_field.dart';
import 'package:firebase_auth_authentication_flutter/providers/checking_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckingAddPage extends StatefulWidget {
  const CheckingAddPage({super.key});

  @override
  State<CheckingAddPage> createState() => _CheckingAddPageState();
}

class _CheckingAddPageState extends State<CheckingAddPage> {
  String selectedMachine = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a new check"),
      ),
      body: Consumer<CheckingProvider>(
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Machines')
                      .snapshots(),
                  builder: (context, snapshot) {
                    List<DropdownMenuItem> machineItems = [];
                    if (!snapshot.hasData) {
                      const CircularProgressIndicator();
                    } else {
                      final machines = snapshot.data?.docs.reversed.toList();

                      machineItems.add(
                        const DropdownMenuItem(
                          value: "0",
                          child: Text("Select Machine"),
                        ),
                      );

                      for (var machine in machines!) {
                        machineItems.add(
                          DropdownMenuItem(
                            value: machine.id,
                            child: Text(
                                "${machine['machine_name']} - ${machine['serial_no']}"),
                          ),
                        );
                      }
                    }
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: SizedBox(
                        height: 52,
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              items: machineItems,
                              onChanged: (machineValue) {
                                setState(() {
                                  selectedMachine = machineValue;
                                });
                                print(machineValue);
                              },
                              value: selectedMachine,
                              isExpanded: false,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
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
                    // value.addMachine(context);
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
