part of 'user_cubit.dart';

class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserResponse extends UserState {
  final List<UserEntity> users;

  UserResponse(this.users);
}

class UserError extends UserState {
final String message;

  UserError({required this.message});

}

