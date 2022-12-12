import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class tampilan extends StatefulWidget {
  const tampilan({Key? key}) : super(key: key);

  @override
  State<tampilan> createState() => _tampilanState();
}

class _tampilanState extends State<tampilan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(),
      body : LayoutBuilder(
        builder: (context, constraints){
        if(constraints.maxWidth > 500){
          return TampilanLebar();
        } else {
          return TampilanNormal();
        }
      })
    );
  }
  
    Widget TampilanLebar(){
    return Center(
      child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.amber,
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.black,
          )
        ],
      ),
    );
  }

  Widget TampilanNormal(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.amber,
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}