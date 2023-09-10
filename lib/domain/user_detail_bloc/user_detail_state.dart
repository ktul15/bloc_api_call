part of 'user_detail_bloc.dart';

sealed class UserDetailState extends Equatable {
  const UserDetailState();
}

final class UserDetailInitial extends UserDetailState {
  @override
  List<Object?> get props => [];
}

class UserDetailLoading extends UserDetailState {
  @override
  List<Object?> get props => [];
}

class UserDetailSuccess extends UserDetailState {
  final User user;

  const UserDetailSuccess({required this.user});

  @override
  List<Object?> get props => [];
}
