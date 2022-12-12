import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class contoh extends StatefulWidget {
  const contoh({Key? key}) : super(key: key);

  @override
  State<contoh> createState() => _contohState();
}

class _contohState extends State<contoh> {
  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar : AppBar(),
      body : Container(
        child: GridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: (lebar > 500) ? 3 : 2,
          children: <Widget> [
            Container(
              height: 100,
              width: 100,
              child: GridText('1'),
            ),
            Container(
              height: 100,
              width: 100,
              child: GridText('2'),
            ),
            Container(
              height: 100,
              width: 100,
              child: GridText('3'),
            ),
            Container(
              height: 100,
              width: 100,
              child: GridText('4'),
            ),
            Container(
              height: 100,
              width: 100,
              child: GridText('5'),
            ),
            Container(
              height: 100,
              width: 100,
              child: GridText('6'),
            )
          ]
          
        ),
      )
    );
  }
  Widget GridText(String nilai){
    return Center(
      child: Text(
        nilai,
        style: TextStyle(
          fontSize: 60,
          color: Colors.white
        ),      ),
    );
  }
}