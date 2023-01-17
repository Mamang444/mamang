import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mamang/model/list_users_model.dart';

class CekSaldo extends StatefulWidget {
  final ListUsersModel user;
  const CekSaldo({Key? key, required this.user}) : super(key: key);

  @override
  State<CekSaldo> createState() => _CekSaldoState();
}

class _CekSaldoState extends State<CekSaldo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Text('Jumlah Saldo Anda :'),
            Text(widget.user.saldo.toString())
          ],
        ),
      ),
    );
  }
}