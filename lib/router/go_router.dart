import 'package:bloc_api_call_demo/presentation/user_detail_page.dart/user_detail_page.dart';
import 'package:bloc_api_call_demo/presentation/users_list_page/users_list_page.dart';
import 'package:bloc_api_call_demo/router/path_names.dart';
import 'package:go_router/go_router.dart';

final go_router = GoRouter(
  initialLocation: PathNames.usersList,
  routes: [
    GoRoute(
        path: PathNames.usersList,
        builder: (context, state) {
          return const UsersListPage();
        },
        routes: [
          GoRoute(
            path: PathNames.userDetail,
            name: PathNames.userDetail,
            builder: (context, state) {
              return UserDetailPage(
                userId: int.parse(state.extra.toString()),
              );
            },
          )
        ]),
  ],
);
