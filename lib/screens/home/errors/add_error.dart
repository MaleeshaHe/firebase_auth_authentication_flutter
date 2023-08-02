import 'package:firebase_auth_authentication_flutter/providers/error_add_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/custom_text_field.dart';

class AddErrorPage extends StatefulWidget {
  const AddErrorPage({super.key});

  @override
  State<AddErrorPage> createState() => _AddErrorPageState();
}

class _AddErrorPageState extends State<AddErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new error"),
      ),
      body: Consumer<ErrorAddProvider>(
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  lable: "Error Name",
                  prefixIcon: Icons.error,
                  controller: value.errorNameController,
                ),
                CustomTextField(
                  lable: "Error Type",
                  prefixIcon: Icons.type_specimen,
                  controller: value.errorTypeController,
                ),
                ElevatedButton(
                  onPressed: () {
                    value.addError(context);
                  },
                  child: const Text("Add Error"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
