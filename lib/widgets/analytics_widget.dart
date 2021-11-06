import '../providers/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Analytics extends StatelessWidget {
  Widget AnalyticsCard(BuildContext context, IconData iconData,
      String analyticsTitle, String info) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(iconData, size: 50, color: Theme.of(context).accentColor),
        Text(
          analyticsTitle,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          info,
          style: const TextStyle(fontSize: 20),
        )
      ],
    );
  }

  // List<Widget> infoCards = [];

  Widget WebCardsView(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      padding: const EdgeInsets.all(25),
      children: <Widget>[
        Card(
          child: AnalyticsCard(
              context,
              Icons.add_shopping_cart_rounded,
              'Total Sales Made',
              orderData.totalNumberOfSales.toString() + ' Sales'),
        ),
        Card(
          child: AnalyticsCard(
              context,
              Icons.warning_amber_rounded,
              'Total Returns',
              orderData.numberOfReturns.toString() + ' Returns'),
        ),
        Card(
          child: AnalyticsCard(
              context,
              Icons.monetization_on_rounded,
              'Average Price Per Sale',
              orderData.averagePrice.toStringAsFixed(2) + ' dollars'),
        ),
        Card(
          child: AnalyticsCard(
              context,
              Icons.money_rounded,
              'Delivered Orders Total Sales',
              orderData.deliveredOrdersSales.toStringAsFixed(2) + ' dollars'),
        ),
        Card(
          child: AnalyticsCard(
              context,
              Icons.airport_shuttle_rounded,
              'Orders waiting to be delivered',
              orderData.numberOfOrdersWaiting.toString() + ' Orders'),
        )
      ],
      // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      //   maxCrossAxisExtent: 200,
      //   childAspectRatio: 3 / 2,
      //   crossAxisSpacing: 20,
      //   mainAxisSpacing: 20,
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return kIsWeb
        ? WebCardsView(context)
        : Column(
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
                                                  orderData
                                                          .numberOfOrdersWaiting
                                                          .toString() +
                                                      ' Orders')));
                    }),
              ),
            ],
          );
  }
}
