import 'package:todo_app/domain/models/user_modal.dart';

abstract class UsersState {}

class InitUserState extends UsersState {}

class LoadingUserState extends UsersState {}

class ResponseUserState extends UsersState {
  final List<UserModel> users;

  ResponseUserState(this.users);
}

class ErrorUserState extends UsersState {
  final String message;

  ErrorUserState(this.message);
}
