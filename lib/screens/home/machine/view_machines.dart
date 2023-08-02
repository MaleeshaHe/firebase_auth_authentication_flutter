import 'package:firebase_auth_authentication_flutter/models/machine_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/machine_add_provider.dart';

class ViewMachinePage extends StatefulWidget {
  const ViewMachinePage({super.key});

  @override
  State<ViewMachinePage> createState() => _ViewMachinePageState();
}

class _ViewMachinePageState extends State<ViewMachinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Machines"),
      ),
      body: FutureBuilder(
        future: Provider.of<MachineAddProvider>(context, listen: false)
            .fetchMachine(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Machine> machines = snapshot.data!;
            return ListView.builder(
              itemCount: machines.length,
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
                          leading: const Icon(Icons.settings),
                          title: Text(machines[index].machine_name.toString()),
                          subtitle: Text(machines[index].machine_id.toString()),
                          trailing: const Icon(Icons.food_bank),
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
