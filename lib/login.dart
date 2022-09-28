import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mamang/beranda.dart';

class Login extends StatefulWidget {
  // const Login ({Key? key}) super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String username = '';
  late String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 19, 17, 175),
          title: Text(
            'Koperasi Undiksha',
            style: TextStyle(),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
              child: Column(children: [
            Container(
              height: 200,
              width: 200,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Image.asset('images/undiksha.png'),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Container(
                        width: 400,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text('Username', textAlign: TextAlign.start)),
                    TextField(
                        onChanged: (value) {
                          username = value;
                        },
                        decoration:
                            InputDecoration(border: OutlineInputBorder())),
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        width: 400,
                        child: Text(
                          'Password',
                          textAlign: TextAlign.start,
                        )),
                    TextField(
                      obscureText: true,
                        onChanged: ((value) {
                          password = value;
                        }),
                        decoration:
                            InputDecoration(border: OutlineInputBorder())),
                    Container(
                      width: 220,
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 19, 17, 175),
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(30)),
                      child: TextButton(
                          onPressed: () {
                            if (username == '123' && password == '123') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Beranda(),
                                ),
                              );
                            }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Daftar Mbanking',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 29, 17, 199)),
                          ),
                          Text(
                            'Lupa Password?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 29, 17, 199)),
                          )
                        ],
                      ),
                    )
                  ],
                )),
            Container(
                margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                height: 50,
                width: 600,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'copyright @2022 by Undiksha',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ))
          ])),
        ));
  }
}
