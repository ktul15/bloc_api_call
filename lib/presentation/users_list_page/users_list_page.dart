import 'package:bloc_api_call_demo/data/repository/usersRepository.dart';
import 'package:bloc_api_call_demo/domain/user_list_bloc/users_list_bloc.dart';
import 'package:bloc_api_call_demo/presentation/users_list_page/components/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersListPage extends StatelessWidget {
  const UsersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersListBloc(usersRepository: UsersRepository())
        ..add(UsersListRequested(pageNum: 1)),
      child: const UsersListView(),
    );
  }
}

class UsersListView extends StatefulWidget {
  const UsersListView({super.key});

  @override
  State<UsersListView> createState() => _UsersListViewState();
}

class _UsersListViewState extends State<UsersListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users List"),
      ),
      body: BlocConsumer<UsersListBloc, UsersListState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is UsersListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UsersListSuccess) {
            return ListView.builder(
              itemCount: state.usersList.data!.length,
              itemBuilder: ((context, index) {
                final currentUser = state.usersList.data![index];
                return UserCard(
                  user: currentUser,
                );
              }),
            );
          } else {
            return const Center(
              child: Text("error"),
            );
          }
        },
      ),
    );
  }
}
