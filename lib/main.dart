import 'package:flutter/material.dart';
import 'package:mamang/login.dart';

void main() async {
  runApp(
    MaterialApp(
      title: 'latihan3',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      home: Login(),
    ),
  );
}
