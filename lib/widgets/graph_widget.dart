import '../widgets/chart.dart';
import '../providers/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Graph extends StatelessWidget {
  //const Graph({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context).getOrders;
    return  Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Orders Per Month Graph',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).accentColor),
                ),
              ),
            ),
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Chart(orderData),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );;
  }
}