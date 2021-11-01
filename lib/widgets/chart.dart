import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './chart_bar.dart';
import '../providers/order.dart';

class Chart extends StatelessWidget {
  //final List<Orders> recentTransactions;
  List<Order> loadedDate = Orders().getOrders;

  Chart(this.loadedDate);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(12, (index) {
      final date = DateTime.now();
      final month = new DateTime(date.day,date.month-index,date.year);
      double totalSum = 0.0;
      //print(loadedDate.length.toString());

      for (var i = 0; i < loadedDate.length; i++) {
        if (loadedDate[i].registeredDate.month == month.month ) {
          totalSum += 1;
        }
      }

      return {
        'month': DateFormat.MMMM().format(month).substring(0, 3),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
          elevation: 6,
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: groupedTransactionValues.map((data) {
                return Flexible(
                  fit: FlexFit.tight,
                              child: ChartBar(
                      data['month'],
                      data['amount'],
                      totalSpending == 0.0
                          ? 0.0
                          : (data['amount'] as double) / totalSpending),
                );
              }).toList(),
            ),
          ),
    );
  }
}
