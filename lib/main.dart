import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'convert.dart';
import 'input.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //controller
  TextEditingController etInput = new TextEditingController();

  //variabel berubah
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;

  void _konversiSuhu(){
    setState(() {
      _inputUser = double.parse(etInput.text);
      _kelvin = _inputUser + 273;
      _reamur = _inputUser * (4/5);
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Konverter Suhu"),
          ),
          body: Container(
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: "Masukkan Suhu Dalam Celcius"),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: etInput,
                  keyboardType: TextInputType.number,
                ),

                Expanded(
                  child: Row (
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          Text('Suhu dalam Kelvin',
                          style: TextStyle(height: 1.5)
                          ),
                          Text('$_kelvin', style: TextStyle(height: 1.5, fontSize:25),),
                        ],
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          Text('Suhu dalam Reamur',
                          style: TextStyle(height: 1.5)
                          ),
                          Text('$_reamur', style: TextStyle(height: 1.5, fontSize:25),),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: 420,
                  height: 50,
                  child: (
                    // ignore: deprecated_member_use
                    RaisedButton(
                      onPressed: _konversiSuhu,
                      color: Colors.blue,
                      hoverColor: Colors.blueGrey,
                      textColor: Colors.white,
                      child: const Text('Konversi Suhu'),
                    )
                  ),
                ), 
              ],
            ),
          ),
        )
      );
  }
}