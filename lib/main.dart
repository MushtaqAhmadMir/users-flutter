import 'package:flutter/material.dart';
import 'package:todo_app/injection.dart';
import 'package:todo_app/presentation/screens/login/login.dart';
import 'package:todo_app/presentation/screens/users/users.dart';


void main() async {
  await init();
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: <String, WidgetBuilder>{
      '/': (BuildContext context) => const Login(),
      'users': (BuildContext context) => const Users()
    });
  }
}
