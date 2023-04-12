import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo_app/domain/failures/failures.dart';
import 'package:todo_app/domain/models/user_model.dart';

abstract class UserRemoteDataSource {
  ///requests users from api
  /// returns [UserModel] if successfull
  /// throws a server error/exception if status code is not 200
  Future <List<UserModel>> getUserData();
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  UserRemoteDataSourceImpl({required this.client});
  final http.Client client;
  final finalurl = Uri.parse('https://reqres.in/api/users');
  @override
   Future <List<UserModel>> getUserData() async {
    final response = await client
        .get(finalurl, headers: {'content-type': 'application/json'});

    if (response.statusCode != 200) {
      throw ServerFailure();
    } else {
      final responseBody = json.decode(response.body) ;
      print(response);
      return fromJosnTouserModel(responseBody);
    }
  }
}
