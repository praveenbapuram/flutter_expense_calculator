import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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
    Transaction(id: 't2', tittle: 'groceries', amount: 16.53, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_usertransctions)
      ],
    );
  }
}
