import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double amount;
  final String label;
  final double totalAmount;

  ChartBar({this.amount, this.label, this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          FittedBox(child: Text('\$${amount.toStringAsFixed(0)}')),
          SizedBox(
            height: 4,
          ),
          Container(
            height: 80,
            width: 10,
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey, width: 1.0)),
                ),
                Container(
                  height: 80 * amount / totalAmount,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(label),
        ],
      ),
    );
  }
}
