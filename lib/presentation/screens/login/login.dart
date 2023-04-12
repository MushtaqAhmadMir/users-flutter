import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:todo_app/presentation/screens/users/users.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? username;
  String? password;
  bool hidePassword = true;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Icon(
                    Icons.lock_outline,
                    size: 100,
                    color: Colors.blueAccent,
                  ),
                ),
                Form(key: formKey, child: _loginUI())
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginUI() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormHelper.inputFieldWidget(
            context,
            'username',
            'Username',
            (val) {
              if (val.isEmpty) {
                return 'Username cant be empty';
              }
            },
            (savedVal) {
              username = savedVal;
            },
            prefixIcon: const Icon(Icons.person),
            showPrefixIcon: true,
          ),
          const SizedBox(
            height: 10,
          ),
          FormHelper.inputFieldWidget(context, 'password', 'Password', (val) {
            if (val.isEmpty) {
              return 'Password cant be empty';
            }
          }, (savedVal) {
            password = savedVal;
          },
              prefixIcon: const Icon(Icons.lock),
              showPrefixIcon: true,
              obscureText: hidePassword,
              suffixIcon: IconButton(
                onPressed: () => {
                  setState(() {
                    hidePassword = !hidePassword;
                  }),
                },
                icon: Icon(
                    hidePassword ? Icons.visibility : Icons.visibility_off),
              )),
          const SizedBox(
            height: 15,
          ),
          Center(
              child: FormHelper.submitButton(
                  'Login',
                  () => {
                        if (_validateAndSave()) {navigateToUsers()}
                      })),
        ],
      ),
    );
  }

  bool _validateAndSave() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  navigateToUsers() {
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => const Users())));
  }
}
