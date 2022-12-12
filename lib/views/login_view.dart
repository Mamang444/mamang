import 'package:flutter/material.dart';
import 'package:mamang/home/home.dart';
import 'package:mamang/model/user_model.dart';
import 'package:mamang/service/login_service.dart';
import 'package:mamang/login_interface/ilogin.dart';
import 'package:mamang/component/login_switch_button.dart';

class LoginView extends StatefulWidget {
 
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ILogin _loginService = LoginService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: <Widget>[
          LoginSwitchButton(),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(hintText: 'E-mail'),
                  textInputAction: TextInputAction.next,
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(hintText: 'Password'),
                  textInputAction: TextInputAction.done,
                  onEditingComplete: () async {
                    UserModel user =  await _loginService.login(_emailController.text, _passwordController.text);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => HomeView(user)));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}