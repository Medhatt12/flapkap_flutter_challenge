import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';



class Order {
  final String id;
  bool isActive;
  final double price;
  final String company;
  final String pictureUrl;
  final String buyer;
  final List<String> tags;
  String status;
  final DateTime registeredDate;

  Order({
    @required this.id,
    @required this.isActive,
    @required this.price,
    @required this.company,
    @required this.pictureUrl,
    @required this.buyer,
    @required this.tags,
    @required this.status,
    @required this.registeredDate,
  });
}

class Orders with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get getOrders {
    return [..._orders];
  }

  Future<void> fetchAndSetOrders() async {
    final String response = await rootBundle.loadString('assets/orders.json');
    final data = await json.decode(response) as List<dynamic>;
    final List<Order> loadedOrders = [];

    if (data == null) {
      return;
    }

    for (var element in data) {
      String tmp = element['price'];
      String tmp2 = tmp.replaceAll(',', '');
      String tmp3 = tmp2.substring(1);
      List<dynamic> tmplist = element['tags'];
      List<String> tmplist2 = [];
      for (var element in tmplist) { 
        tmplist2.add(element.toString());
      }
      loadedOrders.add(Order(
        id: element['id'],
        isActive: element['isActive'],
        price: double.parse(tmp3),
        company: element['company'],
        pictureUrl: element['picture'],
        buyer: element['buyer'],
        tags: tmplist2,
        status: element['status'],
        registeredDate: DateTime.parse(element['registered']),
      ));
    }

    _orders = loadedOrders.toList();
    notifyListeners();
  }

  int get totalNumberOfSales{
    return _orders.length;
  }

  int get numberOfReturns{
    int no = 0;
    for (var element in _orders) {
      if(element.status == 'RETURNED'){
        no++;
      }
    }
    return no;
  }

  int get numberOfOrdersWaiting{
    int no = 0;
    for (var element in _orders) {
      if(element.status == 'ORDERED'){
        no++;
      }
    }
    return no;
  }

  double get averagePrice{
    double sum = 0;

    for (var element in _orders) {
      sum = element.price + sum;
    }

    return sum/totalNumberOfSales;
  }

  

  List<Order> get returnedGetter{
    List<Order> returnedOrders=[];
    for (var element in _orders) {
      if(element.status == 'RETURNED'){
        returnedOrders.add(element);
      }
    }
    return returnedOrders;
  }

  double get deliveredOrdersSales{
    double sales=0;
    for (var element in _orders) {
      if(element.status == 'DELIVERED'){
        sales = sales+element.price;
      }
    }
    return sales;
  }
}
