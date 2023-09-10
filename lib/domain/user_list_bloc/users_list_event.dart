part of 'users_list_bloc.dart';

@immutable
sealed class UsersListEvent extends Equatable {}

class UsersListRequested extends UsersListEvent {
  UsersListRequested();

  @override
  List<Object?> get props => [];
}

class UsersListNextPageRequested extends UsersListEvent {
  UsersListNextPageRequested();

  @override
  List<Object?> get props => [];
}
