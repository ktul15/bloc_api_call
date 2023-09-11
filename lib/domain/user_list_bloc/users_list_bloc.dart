import 'package:bloc/bloc.dart';
import 'package:bloc_api_call_demo/data/repository/usersRepository.dart';
import 'package:bloc_api_call_demo/data/req_res_api/models/user.dart';
import 'package:bloc_api_call_demo/data/req_res_api/models/users_list.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'users_list_event.dart';
part 'users_list_state.dart';

class UsersListBloc extends Bloc<UsersListEvent, UsersListState> {
  UsersListBloc({required UsersRepository usersRepository})
      : _usersRepository = usersRepository,
        super(UsersListInitial()) {
    on<UsersListRequested>((event, emit) async {
      await _onUsersListRequested(event, emit);
    });
  }

  final UsersRepository _usersRepository;

  Future<void> _onUsersListRequested(
    UsersListRequested event,
    Emitter<UsersListState> emit,
  ) async {
    if (state is UsersListInitial) {
      emit(UsersListLoading());
    }

    int pageToFetch = 1;
    List<User> users = [];
    if (state is UsersListSuccess) {
      pageToFetch = (state as UsersListSuccess).pageNum + 1;
      users = (state as UsersListSuccess).users;
      debugPrint("pageToFetch $pageToFetch");
      debugPrint("users $users");
    }

    final res = await _usersRepository.fetchUsersByPage(pageToFetch);

    res.fold((error) {
      debugPrint("error from bloc: $error");
      emit(UsersListFailure(error: error.toString()));
    }, (newUsers) {
      users.addAll(newUsers);
      debugPrint("users: $users");
      emit(UsersListSuccess(
        users: users,
        pageNum: pageToFetch,
      ));

      debugPrint((state as UsersListSuccess).users.length.toString());
      if ((state as UsersListSuccess).users.length < 12) {
        add(UsersListRequested());
      }
    });
  }
}
