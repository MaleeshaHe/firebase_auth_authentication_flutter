import 'package:firebase_auth_authentication_flutter/models/error_model.dart';
import 'package:firebase_auth_authentication_flutter/providers/error_add_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewErrorPage extends StatefulWidget {
  const ViewErrorPage({super.key});

  @override
  State<ViewErrorPage> createState() => _ViewErrorPageState();
}

class _ViewErrorPageState extends State<ViewErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Errors"),
      ),
      body: FutureBuilder(
        future:
            Provider.of<ErrorAddProvider>(context, listen: false).fetchErrors(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Errorm> errors = snapshot.data!;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: errors.length,
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
                          title: Text(errors[index].errorName.toString()),
                          subtitle: Text(errors[index].errorType.toString()),
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
