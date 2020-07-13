import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_expense_calculator/widgets/adaptive_button.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class NewTransaction extends StatefulWidget {
  final Function addTxnHandler;

  NewTransaction(this.addTxnHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _amountController = TextEditingController();

  final _tittleController = TextEditingController();
  DateTime _selectedDate;
  void submitTransaction() {
    final enteredTittle = this._tittleController.text;
    final enteredAmount = double.parse(this._amountController.text);
    if (enteredTittle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTxnHandler(enteredTittle, enteredAmount, _selectedDate);
    print('Amount : ' + enteredAmount.toString());
    print('Tittle : ' + enteredTittle);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print(
        'date picker after '); //this would be executed with out waiting for teh datepicker response.
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitTransaction(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Tittle'),
                controller: _tittleController,
                onSubmitted: (_) => submitTransaction(),
              ),
              Row(
                children: <Widget>[
                  Text(_selectedDate != null
                      ? DateFormat.yMMMd().format(_selectedDate)
                      : 'No Date Choosen..'),
                  AdaptiveFlatButton(
                      text: 'Choose Date',
                      handler: () {
                        _presentDatePicker();
                      })
                ],
              ),
              RaisedButton(
                child: Text("Add Transaction"),
                textColor: Theme.of(context).textTheme.button.color,
                color: Theme.of(context).primaryColor,
                onPressed: submitTransaction,
              )
            ],
          ),
        ),
      ),
    );
  }
}
