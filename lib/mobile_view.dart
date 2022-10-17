import 'package:flutter/material.dart';
import 'package:mamang/tombol.dart';

class MobileView extends StatelessWidget {
  const MobileView({
    Key? key,
  }) : super(key: key);

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
                                          'I KOMANG YANDI CIPTA L.',
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
                                          'Rp. 120.000.000',
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
                      tombol(Icons.payment, 'Cek Saldo'),
                      tombol(Icons.payment, 'Transfer'),
                      tombol(Icons.payment, 'Deposit')
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      tombol(Icons.payment, 'Pembayaran'),
                      tombol(Icons.payment, 'Pinjaman'),
                      tombol(Icons.payment, 'Mutasi')
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