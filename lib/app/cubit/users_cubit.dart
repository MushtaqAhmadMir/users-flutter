import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/cubit/users_state.dart';
import 'package:todo_app/data/repository.dart';

class UsersCubit extends Cubit<UsersState> {
  final UserRepo _userRepo;
  UsersCubit(this._userRepo) : super(InitUserState());

  Future<void> getUsers() async {
    emit(LoadingUserState());
    try {
      final response = await _userRepo.getUsers();
      print('response in Cubit$response');
      emit(ResponseUserState(response));
    } catch (e) {
      print('error in cubit $e');
      emit(ErrorUserState(e.toString()));
    }
  }
}
