import '../widgets/income.dart';
import '../widgets/chart.dart';
import '../providers/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:charts_flutter/flutter.dart' as charts;

class Graph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context).getOrders;
    final ordersReturned = Provider.of<Orders>(context).returnedGetter;
    final List<IncomeData> data = [];
    data.length = 12;
    final List<IncomeData> data1 = [];
    data1.length = 12;

    List<Map<String, Object>> incomePerMonth(List<Order> orders) {
      return Income(orders).groupedValues;
    }

    void populateIncomeData() {
      List<Map<String, Object>> incomeMap = incomePerMonth(orderData);
      for (int i = 0; i < incomeMap.length; i++) {
        data[i] = IncomeData(incomeMap[i]['month'], incomeMap[i]['amount']);
      }
    }

    _getIncomeData() {
      populateIncomeData();
      List<charts.Series<IncomeData, int>> series = [
        charts.Series(
            id: "Sales",
            data: data,
            domainFn: (IncomeData series, _) => series.month,
            measureFn: (IncomeData series, _) => series.sales,
            colorFn: (IncomeData series, _) =>
                charts.MaterialPalette.teal.shadeDefault)
      ];
      return series;
    }

    ///Other Graph
    ///
    ///
    List<Map<String, Object>> OrdersPerMonth(List<Order> orders) {
      return Income(orders).groupedOrderCountValues;
    }

    void populateOrdersData() {
      List<Map<String, Object>> incomeMap = OrdersPerMonth(orderData);
      for (int i = 0; i < incomeMap.length; i++) {
        data1[i] = IncomeData(incomeMap[i]['month'], incomeMap[i]['amount']);
      }
    }

    _getOrdersData() {
      populateOrdersData();
      List<charts.Series<IncomeData, int>> series = [
        charts.Series(
            id: "Sales",
            data: data1,
            domainFn: (IncomeData series, _) => series.month,
            measureFn: (IncomeData series, _) => series.sales,
            colorFn: (IncomeData series, _) =>
                charts.MaterialPalette.teal.shadeDefault)
      ];
      return series;
    }
    

    return kIsWeb
        ? GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1.5 / 1,
            padding: const EdgeInsets.all(25),
            children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.teal, width: 2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Orders Per Month Graph',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: Card(
                            elevation: 0,
                            child: charts.LineChart(
                              _getOrdersData(),
                              animate: true,
                              defaultRenderer: charts.LineRendererConfig(
                                  includePoints: true),
                            ),
                          ),
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
                        border: Border.all(color: Colors.teal, width: 2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Returns Per Month Graph',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
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
                        border: Border.all(color: Colors.teal, width: 2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Income Per Month Graph',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: Card(
                            elevation: 0,
                            child: charts.LineChart(
                              _getIncomeData(),
                              animate: true,
                              defaultRenderer: charts.LineRendererConfig(
                                  includePoints: true),
                            ),
                          ),
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
                                child: Card(),
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

class IncomeData {
  final int month;
  final double sales;

  IncomeData(this.month, this.sales);
}
