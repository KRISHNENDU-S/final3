
import 'dart:convert';

/*import 'package:function.dart';*/
import 'function.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url = '';
  var data;
  String output = 'Output';
  bool checkvalue = false;

  void method3(val) {
    setState(() {
      checkvalue = val;
      url = val.toString();
      print('$checkvalue');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Flask App')),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Checkbox(value: checkvalue,
              onChanged: (checkbool) {
                method3(checkbool);
              },),
            TextButton(
                onPressed: () async {
                  data = data = await fetchdata(url);
                  setState(() {
                    output = data;
                  });
                },
                child: Text(
                  'SUBMIT',
                  style: TextStyle(fontSize: 20),
                )),
            Text(
              output,
              style: TextStyle(fontSize: 40, color: Colors.green),
            )
          ]),
        ),
      ),
    );
  }
}

