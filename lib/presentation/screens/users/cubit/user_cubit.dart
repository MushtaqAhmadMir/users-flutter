import 'package:bloc/bloc.dart';
import 'package:todo_app/data/entities/user_entity.dart';
import 'package:todo_app/domain/failures/failures.dart';
import 'package:todo_app/domain/usecases/user_usecase.dart';

part 'user_state.dart';

const generalFailureMessage =
    'oops something went wrong, please try again later !';
const serverFailureMessage = 'something went wrong !';
const cacheFailureMessage = 'an application error occured !';

class UserCubit extends Cubit<UserState> {
  UserCubit( { required this.userUsecase}) : super(UserInitial());

  final UserUsecase userUsecase;

  void getUsersRequested() async {
    emit(UserLoading());
    final failureOrResponse = await userUsecase.getUsers();
    failureOrResponse.fold(
        (failure) => {emit(UserError(message: _mapFailures(failure)))},
        (response) => {emit(UserResponse(response))});
  }

  String _mapFailures(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
