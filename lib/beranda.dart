import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mamang/login.dart';
import 'package:mamang/mobile_view.dart';
import 'package:mamang/tombol.dart';

class Beranda extends StatefulWidget {
  // const Login ({Key? key}) super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => Login(),
          ));
        }, icon: Icon(Icons.logout))],
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 19, 17, 175),
        title: Text(
          'Koperasi Undiksha',
          style: TextStyle(),
        ),
      ),
      body: LayoutBuilder(builder: ((context, constraints) {
        if (constraints.maxWidth>480) {
          return TabletView();
        } else {
          
        }
      })),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue[700],
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            label: "Setting",
            icon: Icon(Icons.settings),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF1C2474),
        onPressed: () {},
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Icon(Icons.qr_code_scanner),
        ),
        elevation: 4.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


