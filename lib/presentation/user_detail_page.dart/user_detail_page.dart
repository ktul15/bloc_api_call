import 'package:bloc_api_call_demo/data/repository/usersRepository.dart';
import 'package:bloc_api_call_demo/domain/user_detail_bloc/user_detail_bloc.dart';
import 'package:bloc_api_call_demo/presentation/user_detail_page.dart/components/firebase_buttons.dart';
import 'package:bloc_api_call_demo/presentation/users_list_page/components/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key, required this.userId});

  final int userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDetailBloc(usersRepository: UsersRepository())
        ..add(UserDetailRequested(userId: userId)),
      child: UserDetailView(
        userId: userId,
      ),
    );
  }
}

class UserDetailView extends StatefulWidget {
  const UserDetailView({super.key, required this.userId});

  final int userId;

  @override
  State<UserDetailView> createState() => _UserDetailViewState();
}

class _UserDetailViewState extends State<UserDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Detail"),
      ),
      body: BlocConsumer<UserDetailBloc, UserDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is UserDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserDetailSuccess) {
            return Column(
              children: [
                UserCard(user: state.user),
                const FirebaseButtons(),
              ],
            );
          }
          return Center(
            child: Text("error: $state"),
          );
        },
      ),
    );
  }
}
