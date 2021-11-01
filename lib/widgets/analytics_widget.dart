import '../providers/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Analytics extends StatelessWidget {
  //const Analytics({ Key? key }) : super(key: key);

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
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_shopping_cart_rounded,
                                color: Theme.of(context).primaryColor,
                                size: 50,
                              ),
                              const Text(
                                'Total Sales Made',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                orderData
                                        .totalNumberOfSales
                                        .toString() +
                                    ' Sales',
                                style: const TextStyle(
                                    fontSize: 20),
                              ),
                            ],
                          )
                        : index == 1
                            ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.sms_failed_rounded,size: 50,color: Theme.of(context).primaryColor),
                                const Text(
                                'Total Returns',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                                Text(orderData.numberOfReturns.toString()+' Returns',
                                style: const TextStyle(
                                    fontSize: 20),)
                              ],
                            )
                            : index == 2?
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.monetization_on_rounded,size: 50,color: Theme.of(context).primaryColor),
                                const Text(
                                'Average Price Per Sale',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                                Text(orderData.averagePrice.toStringAsFixed(2)+' dollars',
                                style: const TextStyle(
                                    fontSize: 20),)
                              ],
                            )
                            : index==3? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.money_rounded,size: 50,color: Theme.of(context).primaryColor),
                                const Text(
                                'Delivered Orders Total Sales',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                                Text(orderData.deliveredOrdersSales.toStringAsFixed(2)+' dollars',
                                style: const TextStyle(
                                    fontSize: 20),)
                              ],
                  )
                  : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.airport_shuttle_rounded,size: 50,color: Theme.of(context).primaryColor),
                                const Text(
                                'Orders waiting to be delivered',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                                Text(orderData.numberOfOrdersWaiting.toString()+' Orders',
                                style: const TextStyle(
                                    fontSize: 20),)
                              ],
                  )
                ));
              }),
        ),
      ],
    );
  }
}