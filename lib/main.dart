import 'package:flutter/material.dart';
import 'package:mamang/login_interface/login.dart';
import 'package:responsive_framework/responsive_framework.dart';
// import 'package:native_notify/native_notify.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // NativeNotify.initialize(2443, 'eEJdu8jfAr59yFQXeLl81W', null, null);
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
