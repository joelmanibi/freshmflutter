import 'package:flutter/material.dart';
// import '/api_connection/api_connection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'repository/user_repository.dart';
// import 'package:provider/provider.dart';
import 'bloc/authentication_bloc.dart';
import 'splash/splash.dart';
import 'login/login_page.dart';
import 'home/home.dart';
import 'common/common.dart';
// import '/AJOUT_PRODUIT/AjoutProduit.dart';

void main() {
  final userRepository = UserRepository();

  runApp(
      BlocProvider<AuthenticationBloc>(
        create: (context) {
          return AuthenticationBloc(
              userRepository: userRepository
          )..add(AppStarted());
        },
        child: MyApp(userRepository: userRepository),
      )

      
  );
}

class MyApp extends StatelessWidget {
  final UserRepository? userRepository;

  MyApp({Key? key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build (BuildContext context) {
    return  MaterialApp (
      theme: ThemeData(
        backgroundColor: Color(0XFFABEBC6)
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationUninitialized) {
            return SplashPage();
          }
          if (state is AuthenticationAuthenticated) {
            return HomePage();
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginPage(userRepository: userRepository,);
          }
          return LoadingIndicator();
        },
      ),
    );
   
  }
  
}