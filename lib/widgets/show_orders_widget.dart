import '../providers/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ShowOrders extends StatefulWidget {
  @override
  State<ShowOrders> createState() => _ShowOrdersState();
}

class _ShowOrdersState extends State<ShowOrders> {
  bool selected = false;

  Order temp;
  Widget infoEntry(String entry, String info) {
    return Row(
      children: <Widget>[
        const SizedBox(
          width: 100,
        ),
        Text(
          entry,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 50,
        ),
        Text(info)
      ],
    );
  }

  _textSelect(String str) {
    str = str.replaceAll('[', '');
    str = str.replaceAll(']', '');

    return str;
  }

  Widget OrderInfo(Order selectedOrder) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 270,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.teal, width: 2),
              color: Colors.white,
              borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          selectedOrder.pictureUrl,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    title: Text(
                      selectedOrder.buyer,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '\$' + selectedOrder.price.toString(),
                      style: const TextStyle(color: Colors.teal),
                    ),
                    trailing: selectedOrder.status.toString() == 'ORDERED'
                        ? Text(
                            selectedOrder.status.toString(),
                            style: const TextStyle(color: Colors.blue),
                          )
                        : selectedOrder.status.toString() == 'RETURNED'
                            ? Text(
                                selectedOrder.status.toString(),
                                style: const TextStyle(color: Colors.red),
                              )
                            : Text(
                                selectedOrder.status.toString(),
                                style: const TextStyle(color: Colors.teal),
                              ),
                  ),
                  const Divider(
                    color: Colors.teal,
                    height: 40,
                  ),
                  Column(
                    children: <Widget>[
                      infoEntry('Order Id:', selectedOrder.id),
                      const Divider(),
                      infoEntry('Company Name:', selectedOrder.company),
                      const Divider(),
                      infoEntry(
                          'Registered Date:',
                          selectedOrder.registeredDate.day.toString() +
                              '/' +
                              selectedOrder.registeredDate.month.toString() +
                              '/' +
                              selectedOrder.registeredDate.year.toString() +
                              '  -  ' +
                              selectedOrder.registeredDate.hour.toString() +
                              ':' +
                              selectedOrder.registeredDate.minute.toString()),
                      const Divider(),
                      infoEntry('Hashtags:',
                          _textSelect(selectedOrder.tags.toString())),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  int _selectedIndex;
  Widget AllOrders(BuildContext context) {
    final orderData = Provider.of<Orders>(context).getOrders;

    return kIsWeb? 
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.teal,width: 2),
          borderRadius: BorderRadius.circular(30),
          color: Colors.white
        ),
       // color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: orderData.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                        selected = true;
                        temp = orderData[index];
                      });
                    },
                    child: Card(
                      elevation: 3,
                      color:
                          index == _selectedIndex ? Colors.white70 : Colors.white,
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: ListTile(
                        leading: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              orderData[index].pictureUrl,
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        title: Text(orderData[index].buyer),
                        subtitle: Text('\$' +
                            Provider.of<Orders>(context)
                                .getOrders[index]
                                .price
                                .toString()),
                        trailing: orderData[index].status.toString() == 'ORDERED'
                            ? Text(
                                orderData[index].status.toString(),
                                style: const TextStyle(color: Colors.blue),
                              )
                            : orderData[index].status.toString() == 'RETURNED'
                                ? Text(
                                    orderData[index].status.toString(),
                                    style: const TextStyle(color: Colors.red),
                                  )
                                : Text(
                                    orderData[index].status.toString(),
                                    style: const TextStyle(color: Colors.teal),
                                  ),
                      ),
                    ),
                  );
                },
              ),
            )
          ]),
        ),
      ),
    )
    :Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: orderData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                    selected = true;
                    temp = orderData[index];
                  });
                },
                child: Card(
                  color:
                      index == _selectedIndex ? Colors.white70 : Colors.white,
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: ListTile(
                    leading: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          orderData[index].pictureUrl,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    title: Text(orderData[index].buyer),
                    subtitle: Text('\$' +
                        Provider.of<Orders>(context)
                            .getOrders[index]
                            .price
                            .toString()),
                    trailing: orderData[index].status.toString() == 'ORDERED'
                        ? Text(
                            orderData[index].status.toString(),
                            style: const TextStyle(color: Colors.blue),
                          )
                        : orderData[index].status.toString() == 'RETURNED'
                            ? Text(
                                orderData[index].status.toString(),
                                style: const TextStyle(color: Colors.red),
                              )
                            : Text(
                                orderData[index].status.toString(),
                                style: const TextStyle(color: Colors.teal),
                              ),
                  ),
                ),
              );
            },
          ),
        )
      ]),
    );
  }

  Widget OrdersWebView(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: AllOrders(context),
        ),
        Expanded(
          flex: 5,
          child: selected
              ? OrderInfo(temp)
              : const Center(
                  child: Text('Select an order to show more info!',style: TextStyle(fontWeight: FontWeight.bold),),
                ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return kIsWeb ? OrdersWebView(context) : AllOrders(context);
  }
}
