import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/error_model.dart';
import '../../../providers/error_add_provider.dart';

class CheckError extends StatefulWidget {
  const CheckError({super.key});

  @override
  State<CheckError> createState() => _CheckErrorState();
}

class _CheckErrorState extends State<CheckError> {
  List<Errorm> _selectedItems = [];
  List<Errorm> _allItems = [];
  // This will hold all the items retrieved from Firebase

  // Function to fetch data from Firebase

  Future<void> _fetchDataFromFirebase() async {
    CollectionReference error = FirebaseFirestore.instance.collection("Errors");
    QuerySnapshot snapshot = await error.get();
    List<Errorm> errors = [];
    for (var e in snapshot.docs) {
      Errorm error = Errorm.fromJson(e.data() as Map<String, dynamic>);
      errors.add(error);
    }
    setState(() {
      _allItems = errors;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchDataFromFirebase();
  }

  // Function to toggle the selection of an item
  void _toggleItemSelection(Errorm item) {
    setState(() {
      if (_selectedItems.contains(item)) {
        _selectedItems.remove(item);
      } else {
        _selectedItems.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi Selection ListView"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: _allItems.isNotEmpty
                  ? ListView.builder(
                      itemCount: _allItems.length,
                      itemBuilder: (context, index) {
                        final item = _allItems[index];
                        return ListTile(
                          title: Text(item.errorName.toString()),
                          leading: Checkbox(
                            value: _selectedItems.contains(item),
                            onChanged: (value) => _toggleItemSelection(item),
                          ),
                          onTap: () => _toggleItemSelection(
                              item), // Toggle selection on tap as well
                        );
                      },
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            _selectedItems.length > 0
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text(
                          "Delete (${_selectedItems.length})",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {
                          print("Delete List Lenght: ${_selectedItems.length}");
                        },
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
