import 'package:flutter/material.dart';
import 'transaction_item.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transctions;
  final Function deleteTx;
  TransactionList(this.transctions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    print('build transaction_list');
    final mediaQuery = MediaQuery.of(context);
    return transctions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        : ListView(
            children: transctions.map((txn) {
              TransactionItem(
                  key: ValueKey(txn.id),
                  transction: txn,
                  mediaQuery: mediaQuery,
                  deleteTx: deleteTx);
            }).toList(),
          );
  }
}
