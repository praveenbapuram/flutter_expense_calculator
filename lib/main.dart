import 'package:flutter/material.dart';
import 'transaction.dart';
import 'package:intl/intl.dart';

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
  final List<Transaction> transctions = [
    Transaction(id: 't1', tittle: 'shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', tittle: 'groceries', amount: 16.53, date: DateTime.now()),
    Transaction(id: 't3', tittle: 'shoes', amount: 69.99, date: DateTime.now()),
    Transaction(id: 't4', tittle: 'shoes', amount: 69.99, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Flutter APP')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            Card(
              child: Container(
                child: Column(
                  children: <Widget>[
                    ...transctions
                        .map((tx) => Card(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      '\$ ${tx.amount}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.purple),
                                    ),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                      color: Colors.purple,
                                      width: 2,
                                    )),
                                    padding: EdgeInsets.all(10),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        tx.tittle,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        DateFormat('yyyy-MM-dd').format( tx.date),
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ))
                        .toList()
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
