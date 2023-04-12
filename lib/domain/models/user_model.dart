import 'package:equatable/equatable.dart';
import 'package:todo_app/data/entities/user_entity.dart';

class UserModel extends UserEntity with EquatableMixin {
  UserModel(
      {required String name, required String email, required String avatar})
      : super(name: name, avatar: avatar, email: email);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    print('json data...${json['data']}');
    final dataArray = json['data'] as List;
    print('$dataArray');
    return UserModel(
        name: dataArray[0]['first_name'],
        email: dataArray[0]['email'],
        avatar: dataArray[0]['avatar']);
  }
}

List<UserModel> fromJosnTouserModel(Map<String, dynamic> json) {
  print('json data...${json['data']}');
  final dataArray = json['data'] as List;
  print('${dataArray[0]}');
  return dataArray.map((e) {
    return UserModel(
        name: e['first_name'], email: e['email'], avatar: e['avatar']);
  }).toList();
}
