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
  String output = 'SAVED DATA';
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
      "title": "Roll no:2",
    },
    {
      "id": 2,
      "value": false,
      "title": "Roll no:3",
    },
    {
      "id": 3,
      "value": false,
      "title": "Roll no:4",
    },
    {
      "id": 4,
      "value": false,
      "title": "Roll no:5",
    },
    {
      "id": 5,
      "value": false,
      "title": "Roll no:6",
    },
    {
      "id": 6,
      "value": false,
      "title": "Roll no:7",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 64.0),
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
                      } else {
                        multipleSelected.add(checkListItems[index]);
                      }
                      url = 'http://10.0.2.2:5000/api?query=' + checkListItems[index]["title"].toString();
                      print('$url');
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 64.0),
            Text(
              multipleSelected.isEmpty ? "" : multipleSelected.toString(),
              style: const TextStyle(
                fontSize: 22.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
                onPressed: () async {
                  data = await fetchdata(url);
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
              style: TextStyle(fontSize: 40, color: Colors.green),
            )

          ],
        ),
      ),
    );
  }
}