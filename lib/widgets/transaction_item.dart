import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transction,
    @required this.mediaQuery,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transction;
  final MediaQueryData mediaQuery;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(child: Text('\$${transction.amount}')),
          ),
        ),
        title: Text(
          transction.tittle,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transction.date),
        ),
        trailing: mediaQuery.size.width > 500
            ? FlatButton.icon(
                icon: const Icon(Icons.delete),
                textColor: Theme.of(context).errorColor,
                label: const Text('Delete'),
                onPressed: () {
                  deleteTx(transction.id);
                },
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () {
                  deleteTx(transction.id);
                },
              ),
      ),
    );
  }
}
