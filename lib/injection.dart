import 'package:get_it/get_it.dart';
import 'package:todo_app/data/datasource/user_remote_datasource.dart';
import 'package:todo_app/data/repository/user_repo_impl.dart';
import 'package:todo_app/domain/repository/user_repo.dart';
import 'package:todo_app/domain/usecases/user_usecase.dart';
import 'package:todo_app/presentation/screens/users/cubit/user_cubit.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => http.Client());
  sl.registerFactory<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: sl()));

  sl.registerFactory<UserRepo>(
      () => UserRepoImplementation(userRemoteDataSource: sl()));

//!doman layer
  sl.registerFactory(() => UserUsecase(userRepo: sl()));

//!data layer

  //!externs

  //!application layer
  sl.registerFactory(() => UserCubit(userUsecase: sl()));
}
