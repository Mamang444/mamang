import 'package:flutter/material.dart';

class tombol extends StatelessWidget {
  var itombol;
  final String nmtombol;
  final VoidCallback onPressed;

  tombol(this.itombol, this.nmtombol, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          borderRadius: BorderRadius.circular(50),
          elevation: 10,
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(50)),
            child: InkWell(
              onTap: onPressed,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    itombol,
                    size: 40,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(nmtombol)
      ],
    ) ;

  }
}