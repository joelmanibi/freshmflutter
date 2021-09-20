import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/login/bloc/login_bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
        username: _usernameController.text,
        password: _passwordController.text,
      ));
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFaliure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Echeque de connexion'),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
            child: Form(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    

                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0XFFFBF8F6 ),
                        hintText: "Nom d'utilisateur",
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0XFF14271C),
                        )
                      ),
                      controller: _usernameController,
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    TextField(
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0XFFFBF8F6 ),
                        hintText: "Mot de passe",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0XFF14271C),
                        )
                      ),
                      controller: _passwordController,
                    ),
                    
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
              onPressed: (){
                // ignore: null_check_always_fails
                state is! LoginLoading? _onLoginButtonPressed(): null!;
              },
              child: Text('Connexion'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                        ),
                  padding: EdgeInsets.symmetric(horizontal: 110, vertical: 13),
                  textStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
              
             ),
                    Container(
                      child: state is LoginLoading
                          ? CircularProgressIndicator()
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}