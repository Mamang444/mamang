import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:mamang/service/list_users_service.dart';


class Login1 extends StatefulWidget {
  const Login1({Key? key}) : super(key: key);

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {

 TextEditingController usernameController = TextEditingController();
 TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Container(
              child: TextField(

                controller: usernameController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Username",
                  labelStyle: TextStyle(fontSize: 20)
                ),
              ),
            ), 
            Container(
              child: TextField(

                controller: passwordController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(fontSize: 20)
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {
              postLogin(
                usernameController.text,
                passwordController.text
              );
            }, 
            child: Text("Login"))
          ],
        ),
      ),
    );
    
  }
  postLogin (String username, String password) async {
    ListUsersService _service = ListUsersService();
    await _service.postLogin(username, password);
  }
}