import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class TransactionItem extends StatefulWidget {
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
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color bgColor;
  @override
  void initState() {
    // TODO: implement initState
    const availableColor = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple,
    ];

    bgColor = availableColor[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: bgColor,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(child: Text('\$${widget.transction.amount}')),
          ),
        ),
        title: Text(
          widget.transction.tittle,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transction.date),
        ),
        trailing: widget.mediaQuery.size.width > 500
            ? FlatButton.icon(
                icon: const Icon(Icons.delete),
                textColor: Theme.of(context).errorColor,
                label: const Text('Delete'),
                onPressed: () {
                  widget.deleteTx(widget.transction.id);
                },
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () {
                  widget.deleteTx(widget.transction.id);
                },
              ),
      ),
    );
  }
}
