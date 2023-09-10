import 'package:bloc_api_call_demo/data/req_res_api/models/users_list.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});

  final Data user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network("${user.avatar}"),
      title: Text("${user.firstName} ${user.lastName}"),
      subtitle: Text("${user.email}"),
    );
  }
}
