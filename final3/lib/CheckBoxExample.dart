import 'package:flutter/material.dart';
import 'function.dart';
import 'dart:convert';

class CheckBoxExample extends StatefulWidget {
  const CheckBoxExample({Key? key}) : super(key: key);

  @override
  State<CheckBoxExample> createState() => _CheckBoxExampleState();
}

class _CheckBoxExampleState extends State<CheckBoxExample> {
  String url = '';
  var data;
  String output = 'Select';
  List a = [];
  List multipleSelected = [];
  List checkListItems = [
    {
      "id": 0,
      "value": false,
      "title": "1",
    },
    {
      "id": 1,
      "value": false,
      "title": "2",
    },
    {
      "id": 2,
      "value": false,
      "title": "3",
    },
    {
      "id": 3,
      "value": false,
      "title": "4",
    },
    {
      "id": 4,
      "value": false,
      "title": "5",
    },
    {
      "id": 5,
      "value": false,
      "title": "6",
    },
    {
      "id": 6,
      "value": false,
      "title": "7",
    },
    {
      "id": 7,
      "value": false,
      "title": "8",
    },
    {
      "id": 8,
      "value": false,
      "title": "9",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CLASS-1A'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        titleSpacing: 70.0,
        toolbarOpacity: 0.9,),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
        child: Column(
          children: [
            Column(
              children: List.generate(
                checkListItems.length,
                    (index) => CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Text(
                    checkListItems[index]["title"],
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  value: checkListItems[index]["value"],
                  onChanged: (value) {
                    setState(() {
                      checkListItems[index]["value"] = value;
                      if (multipleSelected.contains(checkListItems[index])) {
                        multipleSelected.remove(checkListItems[index]);
                        a.remove(checkListItems[index]["title"]);
                      } else {
                        multipleSelected.add(checkListItems[index]);
                        a.add(checkListItems[index]["title"]);
                      }
                      //url = 'http://10.0.2.2:5000/api?query=' + checkListItems[index]["title"].toString();
                      //print('$url');
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 64.0),
            /*Text(
              multipleSelected.isEmpty ? "" : multipleSelected.toString(),
              style: const TextStyle(
                fontSize: 22.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),*/
            ElevatedButton(
                onPressed: () async {
                   await fetchdata(a);
                  //var decoded = int.parse(data);
                  setState(() {
                    output = 'successful';
                  });
                },
                child: Text(
                  'SUBMIT',
                  style: TextStyle(fontSize: 20),
                )),
            Text(
              output,
              style: TextStyle(fontSize: 20, color: Colors.blue),
            )

          ],
        ),
      ),
    );
  }
}