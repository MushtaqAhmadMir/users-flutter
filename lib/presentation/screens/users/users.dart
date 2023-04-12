import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/presentation/screens/users/cubit/user_cubit.dart';
import 'package:todo_app/presentation/screens/users/widgets/user_comp.dart';

import '../../../injection.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = sl<UserCubit>();
        cubit.getUsersRequested();
        return cubit;
      },
      child: MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                title: const Text('Users'),
              ),
              body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocConsumer<UserCubit, UserState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return BlocBuilder<UserCubit, UserState>(
                          builder: (context, state) {
                        print(state);
                        if (state is UserInitial || state is UserLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is UserResponse) {
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
                        } else if (state is UserError) {
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
                      });
                    },
                  )))),
    );
  }
}
