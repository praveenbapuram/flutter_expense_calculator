import 'package:flutter/material.dart';
import 'package:flutter_expense_calculator/widgets/new_transaction.dart';
import 'package:flutter_expense_calculator/widgets/transaction_list.dart';

import 'models/transaction.dart';

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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _addNewTransaction(String txTittle, double txnAmount) {
    final newTxn = new Transaction(
        id: DateTime.now().toString(),
        tittle: txTittle,
        amount: txnAmount,
        date: DateTime.now());

    setState(() {
      _usertransctions.add(newTxn);
    });
  }

  final List<Transaction> _usertransctions = [
    Transaction(id: 't1', tittle: 'shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', tittle: 'groceries', amount: 16.53, date: DateTime.now()),
  ];

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter APP'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _startAddNewTransaction(context);
            },
          )
        ],
      ),
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
            TransactionList(_usertransctions)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _startAddNewTransaction(context);
          }),
    );
  }
}
