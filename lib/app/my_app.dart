import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/cubit/users_cubit.dart';
import 'package:todo_app/app/cubit/users_state.dart';
import 'package:todo_app/app/widgets/user_comp.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<UsersCubit>();
      cubit.getUsers();
    });

    // print(data);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<UsersCubit, UsersState>(builder: (context, state) {
            print(state);
            if (state is InitUserState || state is LoadingUserState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ResponseUserState) {
              final users = state.users;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: User(
                      name: user.name,
                      email: user.email,
                      avatar: user.avatar,
                    ),
                  );
                },
              );
            } else if (state is ErrorUserState) {
              return const Center(
                  child: Text(
                'Something went wrong !',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ));
            } else {
              return Center(
                  child: Text(
                state.toString(),
                style: const TextStyle(fontSize: 20),
              ));
            }
          }),
        ),
      ),
    );
  }
}
