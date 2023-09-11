import 'package:bloc/bloc.dart';
import 'package:bloc_api_call_demo/data/repository/usersRepository.dart';
import 'package:bloc_api_call_demo/data/req_res_api/models/user.dart';
import 'package:bloc_api_call_demo/utils/api_exceptions.dart';
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
    on<UserDetailAddToFirestore>((event, emit) async {
      await _onUserDetailAddToFirestore(event, emit);
    });
    on<UserDetailDeleteFromFirestore>((event, emit) async {
      await _onUserDetailDeleteFromFirestore(event, emit);
    });
  }

  final UsersRepository _usersRepository;

  Future<void> _onUserDetailRequested(
      UserDetailRequested event, Emitter<UserDetailState> emit) async {
    emit(UserDetailLoading());

    final res = await _usersRepository.fetchUserById(event.userId);

    res.fold((error) {
      emit(UserDetailFailure(error: error.toString()));
      debugPrint("error from detail bloc : $error");
    }, (user) => emit(UserDetailSuccess(user: user)));
  }

  Future<void> _onUserDetailAddToFirestore(
      UserDetailAddToFirestore event, Emitter<UserDetailState> emit) async {
    try {
      await _usersRepository.addDataToFireStore(event.user);
    } catch (e) {
      emit(UserDetailFailure(error: e.toString()));
    }
  }

  Future<void> _onUserDetailDeleteFromFirestore(
      UserDetailDeleteFromFirestore event,
      Emitter<UserDetailState> emit) async {
    try {
      await _usersRepository.deleteDataFromFirestore(event.userId);
    } catch (e) {
      emit(UserDetailFailure(error: e.toString()));
    }
  }
}
