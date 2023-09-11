import 'package:bloc_api_call_demo/data/req_res_api/models/user.dart';
import 'package:bloc_api_call_demo/presentation/users_list_page/components/image_dialog.dart';
import 'package:bloc_api_call_demo/router/path_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.goNamed(PathNames.userDetail, extra: user.id);
      },
      leading: CachedNetworkImage(
        imageUrl: "${user.avatar}",
        imageBuilder: (context, imageProvider) => Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        placeholder: ((context, url) {
          return const CircularProgressIndicator();
        }),
        errorWidget: ((context, url, error) {
          return const Icon(Icons.error);
        }),
      ),
      title: Text("${user.firstName} ${user.lastName}"),
      subtitle: Text("${user.email}"),
    );
  }
}
