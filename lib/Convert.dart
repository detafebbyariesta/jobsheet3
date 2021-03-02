import 'package:flutter/material.dart';

//Berisi button dan reference ke function yang digunakan untuk
//melakukan setState().

class Convert extends StatelessWidget {
  
  final Function konvertHandler;
  Convert({Key key, @required this.konvertHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: konvertHandler,
        color: Colors.blueAccent,
        textColor: Colors.white,
        child: Text("Konversi Suhu"),
      ),
    );
  }
}
