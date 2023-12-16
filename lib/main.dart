import 'package:flutter/material.dart';
import './secondapp.dart';
import 'model/model.dart';
import 'input_new_op.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    routes: {
      '/first': (context) => MyApp(),
      '/second': (context) => SecondApp(),
      '/third': (context) => InputNewOp(),
    },
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Operation> _userOps = [
    Operation(
      id: 0,
      title: 'New Shoes',
      amount: 19.99,
      date: DateTime.now(),
    ),
    Operation(
      id: 1,
      title: 'Weekly Groceries',
      amount: 36.53,
      date: DateTime.now(),
    ),
    Operation(
      id: 2,
      title: 'New Shoes',
      amount: 29.99,
      date: DateTime.now(),
    ),
    Operation(
      id: 3,
      title: 'Weekly Groceries',
      amount: 46.53,
      date: DateTime.now(),
    ),
    Operation(
      id: 4,
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Operation(
      id: 5,
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
    Operation(
      id: 6,
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
    Operation(
      id: 7,
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
    Operation(
      id: 8,
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
    Operation(
      id: 9,
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 250.0,
              width: double.infinity,
              child: Row(children: [
                ElevatedButton(
                  child: Text('Go to 2'),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.yellow,
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/second',
                    );
                  },
                ),
                TextButton(
                  child: Text(
                    'Button 2',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {},
                ),
              ]),
            ),
            SizedBox(
              height: 300.0,
              width: double.infinity,
              child: ListView.builder(
                itemCount: _userOps.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.greenAccent,
                    child: ListTile(
                      onTap: (){},
                      title: Text("${_userOps[index].amount}"),
                      subtitle: Text(_userOps[index].title),
                      leading: Icon(Icons.wb_sunny),
                      trailing: Icon(Icons.keyboard_arrow_right),

                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          returnDataFromSecondScreen(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // T
    );
  }

  void returnDataFromSecondScreen(BuildContext context) async {
    final result = await Navigator.pushNamed(
      context,
      '/third',
    );

    setState(() {
      _userOps.add(result as Operation);
    });
  }
}
