import 'package:dartz/dartz.dart';
import 'package:todo_app/data/entities/user_entity.dart';
import 'package:todo_app/domain/failures/failures.dart';

abstract class UserRepo {
  Future<Either<Failure, List<UserEntity>>> getUsersFromDataSource();

}