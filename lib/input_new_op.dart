import 'package:flutter/material.dart';
import 'model/model.dart';

class InputNewOp extends StatefulWidget {
  @override
  InputNewOpWidget createState() => InputNewOpWidget();
}

class InputNewOpWidget extends State {
  String dropdownValue = 'One';
  Operation newOp = Operation(
    id: 0,
    title: "",
    amount: 0.0,
    date: DateTime.now(),
  );
  TextEditingController titleOp = TextEditingController();
  TextEditingController amountOp = TextEditingController();
  TextEditingController dateOp = TextEditingController();

  List<String> spinnerItems = ['One', 'Two', 'Three', 'Four', 'Five'];
  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    String operation = "";
    String sum = "0.0";

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Operation'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: <Widget>[
          Text("Date:"),
          TextField(),
          Text("Операция"),
          TextField(
            controller: titleOp,
            // onChanged: (val) => operation = val,
          ),
          const Text("Сумма"),
          TextField(
              controller: amountOp,
           // onChanged: (val) => sum = val,
          ),
          ElevatedButton(
            onPressed: () {
              //  newOp.id = _uswerOp.length;
              newOp.title = titleOp.text;
              newOp.amount = double.parse(amountOp.text);
              //newOp.date = DateTime.now();
              Navigator.pop(context,newOp);
            },
            child: const Text("Сохранить"),
          ),
        ]),
      ),
    );
  }
}
