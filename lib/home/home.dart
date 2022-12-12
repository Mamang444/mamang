import 'package:flutter/material.dart';
import 'package:mamang/model/user_model.dart';
import 'package:mamang/model/user_model.dart';

class HomeView extends StatefulWidget {
  final UserModel user;
  HomeView(@required this.user);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(widget.user.email),
            Text(widget.user.token),
          ],
        ) ),

    );
  }
}