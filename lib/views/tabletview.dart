import 'package:flutter/material.dart';

class TabletView extends StatefulWidget {
  TabletView({
    Key? key,
  }) : super(key: key);

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {
  int currentSelectedState = 0;
  String TextTitle = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    child: ClipRRect(
                      child: InkWell(
                        onTap: (() {
                          setState(() {
                            currentSelectedState = 0;
                          });
                        }),
                        child: Image.asset(
                          'images/undiksha.png',
                        ),
                      ),
                    ),
                    padding: EdgeInsets.all(6),
                    color: Colors.amber,
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.3,
                    // flex: 1,
                    child: ListView(
                      children: [
                        Material(
                          color: Color.fromARGB(255, 66, 164, 244),
                          elevation: 10.0,
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                TextTitle = 'Cek Saldo';
                                currentSelectedState = 1;
                              });
                            },
                            leading: Icon(
                              Icons.wallet,
                              size: 35,
                            ),
                            title: Text(
                              'Cek Saldo',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                          color: Color.fromARGB(255, 66, 164, 244),
                          elevation: 10.0,
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                TextTitle = 'Transfer';
                                currentSelectedState = 2;
                              });
                            },
                            leading: Icon(
                              Icons.wallet,
                              size: 35,
                            ),
                            title: Text(
                              'Transfer',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                          color: Color.fromARGB(255, 66, 164, 244),
                          elevation: 10.0,
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                TextTitle = 'Deposito';
                                currentSelectedState = 3;
                              });
                            },
                            leading: Icon(
                              Icons.wallet,
                              size: 35,
                            ),
                            title: Text(
                              'Deposito',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                          color: Color.fromARGB(255, 66, 164, 244),
                          elevation: 10.0,
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                TextTitle = 'Pembayaran';
                                currentSelectedState = 4;
                              });
                            },
                            leading: Icon(
                              Icons.wallet,
                              size: 35,
                            ),
                            title: Text(
                              'Pembayaran',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                          color: Color.fromARGB(255, 66, 164, 244),
                          elevation: 10.0,
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                TextTitle = 'Pinjaman';
                                currentSelectedState = 5;
                              });
                            },
                            leading: Icon(
                              Icons.wallet,
                              size: 35,
                            ),
                            title: Text(
                              'Pinjaman',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                          color: Color.fromARGB(255, 66, 164, 244),
                          elevation: 10.0,
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                TextTitle = 'Mutasi';
                                currentSelectedState = 6;
                              });
                            },
                            leading: Icon(
                              Icons.wallet,
                              size: 35,
                            ),
                            title: Text(
                              'Mutasi',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    color: Colors.blue,
                  ),
                ],
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: currentSelectedState == 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                ],
                              ),
                            ),
                          ],
                        )
                      : Text(TextTitle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}