import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_app/domain/models/user_modal.dart';

class UserRepo {
  final finalurl = Uri.parse('https://reqres.in/api/users');
  final client = http.Client();

  Future<List<UserModel>> getUsers() async {
    final response = await client.get(finalurl);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
     
      final finalData=json['data'] as List;
       print('final data $finalData');
      final result = finalData.map((e) {
        return UserModel(
          name: e['first_name'],
          email: e['email'],
          avatar: e['avatar'],
        );
      }).toList();
      return result;
    } else {
      throw 'SomeThing went Wrong ${response.statusCode}';
    }

    //
  }
}
