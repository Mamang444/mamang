import 'package:flutter/material.dart';
import 'package:mamang/model/list_users_model.dart';
import 'package:mamang/service/list_users_service.dart';

class penarikan extends StatefulWidget {
  final ListUsersModel user;
  const penarikan({Key? key, required this.user}) : super(key: key);

  @override
  State<penarikan> createState() => _penarikanState();
}

class _penarikanState extends State<penarikan> {
  List<ListUsersModel> _listUser = [];

  tariksaldo(int user_id, String jumlah_tarikan) async {
    ListUsersService _service = ListUsersService();
    await _service.tarik(user_id, double.parse(jumlah_tarikan));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Penarikan'),
        ),
        body: TextButton(
            onPressed: () {
              tarikDialog(int.parse(widget.user.user_id!));
            },
            child: Text('Tarik')));
  }

  tarikDialog(int id) {
    TextEditingController jumlahPenarikanController = TextEditingController();
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
                    await tariksaldo(id, jumlahPenarikanController.text);

                    Navigator.pop(context);
                  },
                  child: Text('Tarik'),
                ),
              ],
              title: Text('Penarikan'),
              content: TextField(
                decoration: InputDecoration(
                  labelText: "jumlah Penarikan"
                ),
                controller: jumlahPenarikanController,
              ),
            ));
  }
}
