import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '/repository/user_repository.dart';

import '/bloc/authentication_bloc.dart';
import '/login/bloc/login_bloc.dart';
import '/login/login_form.dart';

class LoginPage extends StatelessWidget {
  final UserRepository? userRepository;

  LoginPage({Key? key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF3C7BD),

      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository!,
          );
        },
        child: LoginForm(),
      ),
    );
  }
}