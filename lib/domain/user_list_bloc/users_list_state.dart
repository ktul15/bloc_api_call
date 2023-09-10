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
  final List<User> users;
  final int pageNum;

  UsersListSuccess({
    required this.users,
    required this.pageNum,
  });

  @override
  List<Object?> get props => [users, pageNum];
}

final class UsersListFailure extends UsersListState {
  final String error;

  UsersListFailure({required this.error});

  @override
  List<Object?> get props => [error];
}

final class UsersListNextPageLoading extends UsersListState {
  final List<User> users;
  final int pageNum;

  UsersListNextPageLoading({
    required this.users,
    required this.pageNum,
  });

  @override
  List<Object?> get props => [users, pageNum];
}

final class UsersListNextPageSuccess extends UsersListState {
  final List<User> users;
  final int pageNum;

  UsersListNextPageSuccess({
    required this.users,
    required this.pageNum,
  });

  @override
  List<Object?> get props => [users, pageNum];
}

final class UsersListNextPageFailure extends UsersListState {
  final String error;

  UsersListNextPageFailure({required this.error});

  @override
  List<Object?> get props => [error];
}
