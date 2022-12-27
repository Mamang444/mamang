import 'package:flutter/material.dart';
import 'package:mamang/home/beranda.dart';
import 'package:mamang/register/register.dart';
import 'package:mamang/service/list_users_service.dart';
import 'package:mamang/model/list_users_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String Username = '';
  late String Password = '';

  AlertDialog alert = AlertDialog(
    title: Text("Login Failed"),
    content: Text("Try to Check your Username or Password"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Koperasi Undiksha'),
        centerTitle: true,
        backgroundColor: Color(0xFF1C2474),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    // height: 100,width: 100,
                  child:
                  Image.asset('Assets/images/undiksha.png')),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xFF1C2474)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: const [
                                Text('Username'),
                                Spacer(),
                              ],
                            ),
                            TextField(
                              onChanged: (value) {
                                Username = value;
                              },
                              obscureText: false,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  contentPadding: EdgeInsets.all(1)),
                            ),
                            // InputLogin(Username, false),
                            Row(
                              children: const [
                                Text('Password'),
                                Spacer(),
                              ],
                            ),
                            TextField(
                              onChanged: (value) {
                                Password = value;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                contentPadding: EdgeInsets.all(1),
                              ),
                            ),
                            // InputLogin(Password, true),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              // child: Button('Login'),
                              child: ElevatedButton(
                                onPressed: () async {
                                  ListUsersService _service =
                                      ListUsersService();
                                  ListUsersModel user = await _service
                                      .postLogin(Username, Password);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Beranda(user: user)),
                                  );
                                },
                                child: Text("Login"),
                                style: ElevatedButton.styleFrom(
                                  // backgroundColor: Color(0xFF1C2474),
                                  shape: StadiumBorder(),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () async{
                                    ListUsersService _service =
                                      ListUsersService();
                                  ListUsersModel user = await _service
                                      .postLogin(Username, Password);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Beranda(user: user)),
                                  );
                                  },
                                  child: TextButton(onPressed: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => register()));
                                  }, child: Text('Daftar Sekarang')),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Lupa Password?'),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  // footer(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Color.fromARGB(255, 13, 9, 124),
          height: 20,
          child: Text(
            'Copyright@2022 by SuperMamang',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  postLogin(String username, String password) async {
    ListUsersService _service = ListUsersService();
    await _service.postLogin(username, password);
    // print(user.username);
  }
}
