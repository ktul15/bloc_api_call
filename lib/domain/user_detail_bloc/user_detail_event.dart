part of 'user_detail_bloc.dart';

sealed class UserDetailEvent extends Equatable {
  const UserDetailEvent();
}

class UserDetailRequested extends UserDetailEvent {
  final int userId;

  const UserDetailRequested({required this.userId});

  @override
  List<Object?> get props => [];
}
