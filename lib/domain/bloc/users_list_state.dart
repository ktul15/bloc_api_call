part of 'users_list_bloc.dart';

@immutable
sealed class UsersListState extends Equatable {}

final class UsersListInitial extends UsersListState {
  @override
  List<Object?> get props => [];
}

final class UsersListLoading extends UsersListState {
  @override
  List<Object?> get props => [];
}

final class UsersListSuccess extends UsersListState {
  final UsersList usersList;

  UsersListSuccess({required this.usersList});

  @override
  List<Object?> get props => [usersList];
}
