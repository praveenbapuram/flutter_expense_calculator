import 'package:flutter/material.dart';
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
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                          child: Text('\$${transctions[index].amount}')),
                    ),
                  ),
                  title: Text(
                    transctions[index].tittle,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transctions[index].date),
                  ),
                  trailing: mediaQuery.size.width > 500
                      ? FlatButton.icon(
                          icon: const Icon(Icons.delete),
                          textColor: Theme.of(context).errorColor,
                          label: const Text('Delete'),
                          onPressed: () {
                            deleteTx(transctions[index].id);
                          },
                        )
                      : IconButton(
                          icon: const Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () {
                            deleteTx(transctions[index].id);
                          },
                        ),
                ),
              );
            },
            itemCount: transctions.length,
          );
  }
}
