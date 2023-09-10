import 'package:bloc_api_call_demo/data/req_res_api/models/user.dart';
import 'package:bloc_api_call_demo/presentation/users_list_page/components/image_dialog.dart';
import 'package:bloc_api_call_demo/router/path_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    debugPrint(user.firstName);
    return ListTile(
      onTap: () {
        context.goNamed(PathNames.userDetail, extra: user.id);
      },
      leading: CircleAvatar(
        backgroundImage: NetworkImage("${user.avatar}"),
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
