import 'package:bloc/bloc.dart';
import 'package:bloc_api_call_demo/data/repository/usersRepository.dart';
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
    emit(UsersListLoading());

    try {
      final usersList = await _usersRepository.fetchUsersByPage(event.pageNum);
      emit(UsersListSuccess(usersList: usersList));
    } catch (e) {
      debugPrint("error from bloc: $e");
    }
  }
}
