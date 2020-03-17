import 'package:flutter/material.dart';
import 'package:flutter_train_1/transaction.dart';
import 'package:intl/intl.dart';

class UserTransactions extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;

  UserTransactions({this.transactions, this.removeTransaction});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            Container(
          child: transactions.isEmpty
              ? Column(
                  children: <Widget>[
                    Text(
                      'No transactions added yet!',
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.5,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )
              : ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (ctx, index) {
                    // return TransactionItem(
                    //   title: transactions[index].title,
                    //   amount: transactions[index].amount,
                    //   date: transactions[index].date,
                    // );
                    return Card(
                      key: Key(transactions[index].id),
                      child: ListTile(
                        title: Text(transactions[index].title),
                        subtitle: Text(
                            '${DateFormat.yMMMd().format(transactions[index].date)}'),
                        leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: FittedBox(
                              child: Text(
                                  '\$${transactions[index].amount.toStringAsFixed(2)}'),
                            ),
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => removeTransaction(index),
                          color: Theme.of(context).errorColor,
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
