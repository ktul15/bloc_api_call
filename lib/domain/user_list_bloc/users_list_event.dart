part of 'users_list_bloc.dart';

@immutable
sealed class UsersListEvent extends Equatable {}

class UsersListRequested extends UsersListEvent {
  final int pageNum;

  UsersListRequested({required this.pageNum});

  @override
  List<Object?> get props => [pageNum];
}
