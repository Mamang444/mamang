import 'package:flutter/material.dart';
import 'package:mamang/login_interface/login.dart';
import 'package:mamang/service/list_users_service.dart';
import 'package:mamang/home/beranda.dart';
import 'package:mamang/model/list_users_model.dart';
import 'package:mamang/grid/tombol.dart';
import 'package:mamang/transaksi/setor.dart';
import 'package:mamang/transaksi/tarik.dart';
import 'package:mamang/transaksi/transfer.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileView extends StatefulWidget {
  final ListUsersModel user;
  MobileView({Key? key, required this.user}) : super(key: key);

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  late int saldo = int.parse(widget.user.saldo.toString());
  late String Username = widget.user.username.toString();

  _sendingTel() async {
    var url = Uri.parse("tel:081936992847");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _sendingSMS() async {
    var url = Uri.parse("sms://081936992847");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Center(
        child: Column(
          children: [
            Stack(children: [
              Image.asset('images/bg.png', scale: 0.3),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => LoginPage())));
                        },
                        icon: Icon(Icons.logout)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  '  Selamat Datang ' + Username,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Text(''),
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 100),
                    Material(
                        borderRadius: BorderRadius.circular(15),
                        elevation: 10,
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        ListUsersService _service =
                                            ListUsersService();
                                        saldo = await _service.getSaldo(
                                            int.parse(widget.user.user_id
                                                .toString()));
                                        setState(() {});
                                      },
                                      icon: Icon(Icons.refresh)),
                                  Text(
                                    'Total Saldo :   ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Rp. ' + saldo.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.all(20),
                                    width: 100,
                                    height: 100,
                                    child: Image.asset('images/undiksha.png')),
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        margin:
                                            EdgeInsets.fromLTRB(0, 10, 10, 5),
                                        height: 50,
                                        width: 160,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 219, 219, 219),
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          children: [
                                            Container(
                                                width: 160,
                                                child: Text(
                                                  'Nasabah',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            Container(
                                              width: 160,
                                              child: Text(
                                                widget.user.nama.toString(),
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        height: 50,
                                        width: 160,
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 10, 10),
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 219, 219, 219),
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          children: [
                                            Container(
                                                width: 160,
                                                child: Text(
                                                  'Nomor Rekening',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            Container(
                                              width: 160,
                                              child: Text(
                                                widget.user.nomor_rekening
                                                    .toString(),
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
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ]),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(10, 30, 10, 30),
              decoration: BoxDecoration(
                  // border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      tombol(Icons.payment, 'Setor', () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Setor(user: widget.user)));
                      }),
                      tombol(
                          Icons.transfer_within_a_station_outlined, 'Transfer',
                          () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Transfer(user: widget.user)));
                      }),
                      tombol(Icons.attach_money, 'Penarikan', () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    penarikan(user: widget.user)));
                      })
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
                height: 80,
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 219, 219, 219)),
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
                          '0819-3699-2847',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                    Container(
                        child: Row(
                          children: [
                            IconButton(onPressed: () {
                              _sendingSMS();
                            }, icon: Icon(Icons.message), iconSize: 40),
                            IconButton(onPressed: (){
                              _sendingTel();
                            }, icon: Icon(Icons.call), iconSize: 40,),
                          ],
                        )
                    ),
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
