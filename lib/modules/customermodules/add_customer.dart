import 'package:flutter/material.dart';

class AddCustomer extends StatefulWidget {
  final Function addCust;

  AddCustomer(this.addCust);

  @override
  _AddCustomerState createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(context) {
    final enteredTitle = titleController.text;
    final enteredAmount = amountController.text;

    if (enteredTitle.isEmpty || enteredAmount.isEmpty) {
      return;
    }
    widget.addCust(
      enteredTitle,
      enteredAmount,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              controller: titleController,
              onSubmitted: (_) => submitData(context),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Phone'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(context),
              // onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: () {
                submitData(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
