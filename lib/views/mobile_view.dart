import 'package:flutter/material.dart';
import 'package:mamang/home/beranda.dart';
import 'package:mamang/model/list_users_model.dart';
import 'package:mamang/grid/tombol.dart';
import 'package:mamang/transaksi/transfer.dart';

class MobileView extends StatelessWidget {
  final ListUsersModel user;
  MobileView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.all(20),
                              width: 100,
                              height: 100,
                              child: Image.asset('images/2.jpeg')),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.fromLTRB(0, 10, 10, 5),
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Container(
                                          width: 200,
                                          child: Text(
                                            'Nasabah',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          user.nama.toString(),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  height: 50,
                                  margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Container(
                                          width: 200,
                                          child: Text(
                                            'Total Saldo Anda',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          user.saldo.toString(),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      tombol(Icons.payment, 'Cek Saldo', (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Beranda(user: user)));
                      }),
                      tombol(Icons.payment, 'Transfer', (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Transfer()));
                      }),
                      tombol(Icons.payment, 'Deposit', (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Beranda(user: user)));
                      })
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      tombol(Icons.payment, 'Transfer', (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Beranda(user: user)));
                      }),
                      tombol(Icons.payment, 'Pinjaman', (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Beranda(user: user)));
                      }),
                      tombol(Icons.payment, 'Mutasi', (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Beranda(user: user)));
                      })
                    ],
                  )
                ],
              ),
            ),
            Container(
                decoration: BoxDecoration(color: Colors.lightBlueAccent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Butuh Bantuan?',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '0878-1234-1024',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                    Container(
                        child: Icon(
                      Icons.call,
                      size: 80,
                    )),
                  ],
                ))
          ],
        ),
      )),
    );
  }
}