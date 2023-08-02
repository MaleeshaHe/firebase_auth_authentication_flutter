import 'package:firebase_auth_authentication_flutter/models/error_check_model.dart';
import 'package:firebase_auth_authentication_flutter/providers/checking_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChekingViewPage extends StatefulWidget {
  const ChekingViewPage({super.key});

  @override
  State<ChekingViewPage> createState() => _ChekingViewPageState();
}

class _ChekingViewPageState extends State<ChekingViewPage> {
  List<String> errorsList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Errors"),
      ),
      body: FutureBuilder(
        future: Provider.of<CheckingProvider>(context, listen: false)
            .fetchChecking(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ErrorCheck> errorChecks = snapshot.data!;
            // errorsList =
            //     errorChecks[index].errorList.toString() as List<String>;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: errorChecks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 1)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          iconColor: Colors.red,
                          leading: const Icon(Icons.error_outline_outlined),
                          title: Text(errorChecks[index]
                              .errorList!['errorName']
                              .toString()),
                          subtitle:
                              Text(errorChecks[index].checkDate.toString()),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
