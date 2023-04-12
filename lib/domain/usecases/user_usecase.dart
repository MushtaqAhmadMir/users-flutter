import 'package:dartz/dartz.dart';
import 'package:todo_app/data/entities/user_entity.dart';
import 'package:todo_app/domain/failures/failures.dart';
import 'package:todo_app/domain/repository/user_repo.dart';

class UserUsecase {
  UserUsecase({required this.userRepo});
  final UserRepo userRepo;

  Future<Either<Failure, List <UserEntity>>> getUsers() async {
    return userRepo.getUsersFromDataSource();
  }
}
