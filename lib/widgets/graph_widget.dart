import 'package:flapkap_flutter_challenge/widgets/profit_chart.dart';

import '../widgets/chart.dart';
import '../providers/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Graph extends StatelessWidget {
  //const Graph({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context).getOrders;
    final ordersReturned = Provider.of<Orders>(context).returnedGetter;
    print(ordersReturned.length);
    return kIsWeb
        ? GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1.5/1,
            padding: const EdgeInsets.all(25),
            children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.teal,width: 2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
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
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.teal,width: 2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Returns Per Month Graph',
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
                          child: Chart(ordersReturned),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.teal,width: 2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Income Per Month Graph',
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
                          child: ProfitsChart(orderData),
                        ),
                      ],
                    ),
                  ),
                ),
              ])
        : Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.teal)),
                          child: Column(
                            children: <Widget>[
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
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.teal)),
                          child: Column(
                            children: <Widget>[
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Returns Per Month Graph',
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
                                child: Chart(ordersReturned),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.teal)),
                          child: Column(
                            children: <Widget>[
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Income Per Month Graph',
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
                                child: ProfitsChart(orderData),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
    ;
  }
}
