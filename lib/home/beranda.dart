import 'package:flutter/material.dart';
import 'package:mamang/login_interface/login.dart';
import 'package:mamang/qrcode.dart';
import 'package:mamang/views/tabletview.dart';
import 'package:mamang/views/mobile_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mamang/model/list_users_model.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Beranda extends StatefulWidget {
  final ListUsersModel user;

  const Beranda({Key? key, required this.user}) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  void parseUri() {
    url = Uri.parse(_data);
  }

  static String _data = "";
  Uri url = Uri.parse(_data);
  _scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            '#000000', 'Cancel', true, ScanMode.BARCODE)
        .then(
      (value) => setState(
        () {
          _data = value;
          parseUri();
        },
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           Navigator.pushReplacement(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) => LoginPage(),
      //               ));
      //         },
      //         icon: Icon(Icons.logout))
      //   ],
      //   centerTitle: true,
      //   backgroundColor: Color.fromARGB(255, 19, 17, 175),
      //   title: Text(
      //     'Koperasi Undiksha',
      //     style: TextStyle(),
      //   ),
      // ),
      body: LayoutBuilder(builder: ((context, constraints) {
        if (constraints.maxWidth > 480) {
          return TabletView();
        } else {
          return MobileView(user: widget.user);
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
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => qrcode()),
          ),
        ),
        child: Column(
          children: [
            // TextButton(onPressed: () {_launchUrl();},
            // child: Text(_data)),
            Padding(padding: EdgeInsets.only(top: 15)),
            Icon(Icons.qr_code_scanner),
          ],
        ),
        elevation: 4.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
