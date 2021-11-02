import '../providers/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Analytics extends StatelessWidget {
  Widget AnalyticsCard(
      BuildContext context, IconData iconData,String analyticsTitle, String info) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(iconData,
            size: 50, color: Theme.of(context).accentColor),
        Text(
          analyticsTitle,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          info,
          style: const TextStyle(fontSize: 20),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: Card(
                        child: index == 0
                            ? AnalyticsCard(
                                context,
                                Icons.add_shopping_cart_rounded,
                                'Total Sales Made',
                                orderData.totalNumberOfSales.toString() +
                                    ' Sales')
                            : index == 1
                                ? AnalyticsCard(
                                    context,
                                    Icons.warning_amber_rounded,
                                    'Total Returns',
                                    orderData.numberOfReturns.toString() +
                                        ' Returns')
                                : index == 2
                                    ? AnalyticsCard(
                                        context,
                                        Icons.monetization_on_rounded,
                                        'Average Price Per Sale',
                                        orderData.averagePrice
                                                .toStringAsFixed(2) +
                                            ' dollars')
                                    : index == 3
                                        ? AnalyticsCard(
                                            context,
                                            Icons.money_rounded,
                                            'Delivered Orders Total Sales',
                                            orderData.deliveredOrdersSales
                                                    .toStringAsFixed(2) +
                                                ' dollars')
                                        : AnalyticsCard(
                                            context,
                                            Icons.airport_shuttle_rounded,
                                            'Orders waiting to be delivered',
                                            orderData.numberOfOrdersWaiting
                                                    .toString() +
                                                ' Orders')));
              }),
        ),
      ],
    );
  }
}
