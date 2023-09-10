import 'package:flutter/material.dart';

class FirebaseButtons extends StatelessWidget {
  const FirebaseButtons(
      {super.key,
      required this.addDataToFireStore,
      required this.deleteDataFromFireStore});

  final Function addDataToFireStore;
  final Function deleteDataFromFireStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () => addDataToFireStore(),
            child: const Text("Add user")),
        ElevatedButton(onPressed: () {}, child: const Text("Edit user")),
        ElevatedButton(
            onPressed: () => deleteDataFromFireStore(),
            child: const Text("Delete user")),
      ],
    );
  }
}
