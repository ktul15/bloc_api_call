part of 'user_detail_bloc.dart';

sealed class UserDetailEvent extends Equatable {
  const UserDetailEvent();
}

class UserDetailRequested extends UserDetailEvent {
  final int userId;

  const UserDetailRequested({required this.userId});

  @override
  List<Object?> get props => [userId];
}

class UserDetailAddToFirestore extends UserDetailEvent {
  final User user;

  const UserDetailAddToFirestore({required this.user});

  @override
  List<Object?> get props => [user];
}

class UserDetailDeleteFromFirestore extends UserDetailEvent {
  final int userId;

  const UserDetailDeleteFromFirestore({required this.userId});

  @override
  List<Object?> get props => [userId];
}
