import 'package:todo_app/data/datasource/user_remote_datasource.dart';
import 'package:todo_app/data/exceptions/exceptions.dart';
import 'package:todo_app/domain/failures/failures.dart';
import 'package:todo_app/data/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_app/domain/repository/user_repo.dart';

class UserRepoImplementation extends UserRepo {
  UserRepoImplementation({required this.userRemoteDataSource});
  final UserRemoteDataSource userRemoteDataSource;

  @override
  Future<Either<Failure, List<UserEntity>>> getUsersFromDataSource() async {
    try {
      final result = await userRemoteDataSource.getUserData();

      return right(result
          .map((e) =>
              UserEntity(name: e.name, email: e.email, avatar: e.avatar))
          .toList());
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
