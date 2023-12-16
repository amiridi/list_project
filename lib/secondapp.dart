import 'package:flutter/material.dart';


class SecondApp extends StatefulWidget {
  const SecondApp({Key? key}) : super(key: key);

  @override
  SecondAppWidget createState() => SecondAppWidget();
}

class SecondAppWidget extends State {
  String dropdownValue = 'One';

  List <String> spinnerItems = [
    'One',
    'Two',
    'Three',
    'Four',
    'Five'
  ] ;
  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;

    return Scaffold(
      appBar: AppBar(
        title: Text('SecondApp'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go Back'),
          ),
          DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.red, fontSize: 18),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? data) {
              setState(() {
                dropdownValue = data!;
              });
            },
            items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),

          Text('Selected Item = $dropdownValue',
              style: TextStyle
                (fontSize: 22,
                  color: Colors.black)),
        ]),
      ),
    );
  }
}