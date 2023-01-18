import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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
                    showNotification();

                    Navigator.pop(context);
                  },
                  child: Text('Setor'),
                ),
              ],
              title: Text('Setoran'),
              content: TextField(
                decoration: InputDecoration(
                  labelText: "jumlah Setoran"
                ),
                controller: jumlahSetoranController,
              ),
            ));
  }

  showNotification() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );
    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'high channel',
      'Very important notification!!',
      description: 'the first notification',
      importance: Importance.max,
    );

    await flutterLocalNotificationsPlugin.show(
      1,
      'Bank Undiksha',
      'Berhasil Melakukan Setoran',
      NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description),
      ),
    );
  }
  
}