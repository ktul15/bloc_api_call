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
        ..add(UsersListRequested()),
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
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<UsersListBloc>().add(UsersListRequested());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users List"),
      ),
      body: BlocConsumer<UsersListBloc, UsersListState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is UsersListLoading || state is UsersListNextPageLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UsersListSuccess) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.users.length,
              itemBuilder: ((context, index) {
                final currentUser = state.users[index];
                if (index > state.users.length) {
                  return const Center(
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(strokeWidth: 1.5),
                    ),
                  );
                }
                return UserCard(
                  user: currentUser,
                );
              }),
            );
          } else if (state is UsersListFailure) {
            debugPrint(state.toString());
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Icon(Icons.error),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(state.error),
                ],
              ),
            );
          } else {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(Icons.error),
                  SizedBox(
                    height: 8,
                  ),
                  Text("Unknown Error"),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
