import 'package:flutter/material.dart';
import 'package:flutter_expense_calculator/widgets/new_transaction.dart';
import 'package:flutter_expense_calculator/widgets/user_transactions.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter APP')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              child: Container(
                width: double.infinity,
                child: Text(
                  "This is Chart Holder",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              color: Colors.blue,
              elevation: 5,
            ),
            UserTransactions()
          ],
        ),
      ),
    );
  }
}
