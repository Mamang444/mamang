import 'package:flutter/material.dart';
import 'package:mamang/login_interface/login.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  runApp(
    MaterialApp(
      builder: ((context, child) => ResponsiveWrapper.builder(child,
      breakpoints: [
        ResponsiveBreakpoint.autoScale(480, name: MOBILE),
        ResponsiveBreakpoint.resize(800, name: TABLET),
        ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
      ])),
      title: 'Koperasi Undiksha',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      home: LoginPage(),
    ),
  );
  
}
