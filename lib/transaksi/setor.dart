import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mamang/model/list_users_model.dart';
import 'package:mamang/service/list_users_service.dart';

class Setor extends StatefulWidget {
  final ListUsersModel user;
  const Setor({super.key, required this.user});

  @override
  State<Setor> createState() => _SetorState();
}

class _SetorState extends State<Setor> {
  
    setorSaldo(int user_id, String jumlah_setoran) async {
    ListUsersService _service = ListUsersService();
    await _service.setor(user_id, double.parse(jumlah_setoran));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Setoran'),
      ),
      body: TextButton(onPressed: () {
        setorDialog(int.parse(widget.user.user_id!));
      }, child: Text('Setor')),
    );
  }

   setorDialog(int id) {
    TextEditingController jumlahSetoranController = TextEditingController();
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Batal'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {});
                    await setorSaldo(id, jumlahSetoranController.text);

                    Navigator.pop(context);
                  },
                  child: Text('Setor'),
                ),
              ],
              title: Text('Penarikan'),
              content: TextField(
                decoration: InputDecoration(
                  labelText: "jumlah Penarikan"
                ),
                controller: jumlahSetoranController,
              ),
            ));
  }
}