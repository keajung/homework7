import 'dart:math';

import 'package:flutter/material.dart';

import 'game.dart';

void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {


  HomePage({Key? key}) : super(key: key) {
  }

  void _showOkDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var showSeven = true;

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        child: Container(

          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Icon(
                  Icons.pets,
                  size: 80.0,
                  color: Colors.amber,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 70.0),
                child: Text('กรุณาใส่รหัสผ่าน' ,
                    style: TextStyle(
                        fontSize: 22.0, color: Colors.amber)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 1; i <= 3; i++) buildButton(num: i),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 4; i <= 6; i++) buildButton(num: i),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 7; i <= 9; i++) buildButton(num: i),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30,),
                      child: Container(
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25,),
                      child: Column(
                        children: [
                          Container(
                            child: buildButton(num: 0),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Icon(
                          Icons.backspace,
                          size: 30.0,
                          color: Colors.amber
                      ),
                    ),
                  ]
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  child: Text('ลืมรหัสผ่าน'),
                  onPressed: () {


                    late String message;
                    message = 'ลืมรหัสผ่านเหย๋อ?';

                    _showOkDialog(context, 'RESULT', message);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton({int? num}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: OutlinedButton(
          onPressed: () {
            print('You pressed $num');
          },
          child: Text('$num')),
    );
  }
}