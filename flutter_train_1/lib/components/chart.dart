import "package:flutter/material.dart";
import 'package:flutter_train_1/components/chart_bar.dart';
import 'package:flutter_train_1/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double total = 0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          total += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 3),
        'amount': total,
      };
    }).reversed.toList();
  }

  double get totalAmount {
    return groupedTransactionValues.fold(0.0, (acc, item) {
      return acc += item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          children: groupedTransactionValues
              .map((transaction) => ChartBar(
                    amount: transaction['amount'],
                    label: transaction['day'],
                    totalAmount: totalAmount == 0 ? 1 : totalAmount,
                  ))
              .toList(),
        ),
        width: double.infinity,
      ),
    );
  }
}
