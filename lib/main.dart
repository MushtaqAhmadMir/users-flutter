import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/cubit/users_cubit.dart';
import 'package:todo_app/app/my_app.dart';
import 'package:todo_app/data/repository.dart';

void main(List<String> args) {
  runApp( BlocProvider(
    create: (context) => UsersCubit(UserRepo()),
    child: const MyApp(),
  ));
}
