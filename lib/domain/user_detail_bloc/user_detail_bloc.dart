import 'package:bloc/bloc.dart';
import 'package:bloc_api_call_demo/data/repository/usersRepository.dart';
import 'package:bloc_api_call_demo/data/req_res_api/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'user_detail_event.dart';
part 'user_detail_state.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  UserDetailBloc({required UsersRepository usersRepository})
      : _usersRepository = usersRepository,
        super(UserDetailInitial()) {
    on<UserDetailRequested>((event, emit) async {
      await _onUserDetailRequested(event, emit);
    });
  }

  final UsersRepository _usersRepository;

  Future<void> _onUserDetailRequested(
      UserDetailRequested event, Emitter<UserDetailState> emit) async {
    emit(UserDetailLoading());

    try {
      final user = await _usersRepository.fetchUserById(event.userId);
      emit(UserDetailSuccess(user: user));
    } catch (e) {
      debugPrint("error from detail bloc : $e");
    }
  }
}
