import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './chart_bar.dart';
import '../providers/order.dart';

class Chart extends StatelessWidget {
  
  List<Order> loadedDate = Orders().getOrders;

  Chart(this.loadedDate);

  List<Map<String, Object>> get groupedTransactionValues {
    List<double> months = [];
    months.length = 12;
    
    for(int i=0;i<12;i++){
      months[i]=0;
    }

      for(int x=0;x<loadedDate.length;x++){
       var monthIndex = loadedDate[x].registeredDate.month;
       if(months[monthIndex-1]==null){
         months[monthIndex-1];
       }
       months[monthIndex-1]=months[monthIndex-1] +1;
      }
      return List.generate(12, (index) {
        final date = DateTime.now();
        final month = DateTime(date.day,index+1,date.year);
        final shownData = DateTime(month.day,month.month+6,month.year);
        return {
        'month': DateFormat.MMMM().format(shownData).substring(0, 3),
        'amount': months[index],
      };
      }).toList();
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
          margin:  const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(10),
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
