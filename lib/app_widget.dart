import 'package:flutter/material.dart';
import 'package:mamang/views/login_view.dart';
import 'package:mamang/controller/login_switch_controller.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    ValueListenableBuilder(
      valueListenable: LoginSwitchController.instance.themeSwitch,
      builder: (context, isDark, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginView(),
        theme: 
          ThemeData(brightness: isDark != null ? Brightness.dark : Brightness.light),
          initialRoute: '/login',
          routes: {
            '/login': (_) => LoginView(),
          }
      ),
    );
  }
}
