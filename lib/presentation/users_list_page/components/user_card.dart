import 'package:bloc_api_call_demo/data/req_res_api/models/users_list.dart';
import 'package:bloc_api_call_demo/presentation/users_list_page/components/image_dialog.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});

  final Data user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        // radius: 1,
        backgroundImage: NetworkImage("${user.avatar}"),
        // radius: 1,
        child: GestureDetector(
          onTap: () async {
            await showDialog(
                context: context,
                builder: (_) => ImageDialog(
                      imageUrl: user.avatar!,
                    ));
          },
        ),
      ),
      title: Text("${user.firstName} ${user.lastName}"),
      subtitle: Text("${user.email}"),
    );
  }
}
