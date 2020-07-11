import 'package:flutter/material.dart';
import 'package:flutter_expense_calculator/widgets/chart.dart';
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
      title: "Personal Expences",
      theme: ThemeData(
          // primaryColor : Colors.red  this is fixed colour but the primaryswatch generates the many varients.
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'QuickSand',
          errorColor: Colors.red,
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
              button: TextStyle(color: Colors.white)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _addNewTransaction(
      String txTittle, double txnAmount, DateTime chosenDate) {
    final newTxn = new Transaction(
        id: DateTime.now().toString(),
        tittle: txTittle,
        amount: txnAmount,
        date: chosenDate);

    setState(() {
      _usertransctions.add(newTxn);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _usertransctions.removeWhere((txn) {
        return txn.id == id;
      });
    });
  }

  List<Transaction> get _recentTransactions {
    return _usertransctions.where((txn) {
      return txn.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  final List<Transaction> _usertransctions = [
    Transaction(
        id: 't1',
        tittle: 'shoes',
        amount: 69.99,
        date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(
        id: 't2',
        tittle: 'groceries',
        amount: 16.53,
        date: DateTime.now().subtract(Duration(days: 1))),
  ];

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expences'),
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
            Chart(
              recentTransactions: _recentTransactions,
            ),
            TransactionList(_usertransctions, _deleteTransaction)
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
