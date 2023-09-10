import 'package:flutter/material.dart';

class FirebaseButtons extends StatelessWidget {
  const FirebaseButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: () {}, child: const Text("Add user")),
        ElevatedButton(onPressed: () {}, child: const Text("Edit user")),
        ElevatedButton(onPressed: () {}, child: const Text("Delete user")),
      ],
    );
  }
}
