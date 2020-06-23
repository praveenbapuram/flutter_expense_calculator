import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final amountController = TextEditingController();
  final tittleController = TextEditingController();

  final Function addTxnHandler;

  NewTransaction(this.addTxnHandler);

  void submitTransaction() {
    addTxnHandler(this.tittleController.text, double.parse(this.amountController.text));
    print('Amount : ' + this.amountController.text);
    print('Tittle : ' + this.tittleController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_)=>submitTransaction(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Tittle'),
                  controller: tittleController,
                  onSubmitted: (_)=>submitTransaction(),
                ),
                FlatButton(
                  child: Text("Add Transaction"),
                  textColor: Colors.purple,
                  onPressed: submitTransaction,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
