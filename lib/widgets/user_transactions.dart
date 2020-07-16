import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  List<Transaction> _usertransctions;

  Function _addNewTransaction;

  Function _deleteTxn;

  @override
  Widget build(BuildContext context) {
    print('build user_transactions');
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_usertransctions, _deleteTxn)
      ],
    );
  }
}
