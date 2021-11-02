import '../providers/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowOrders extends StatelessWidget {
  //const ShowOrders({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context).getOrders;
    return Column(children: [
      Expanded(
        child: ListView.builder(
          itemCount: orderData.length,
          itemBuilder: (context, index) {
            return Card(
                margin: const EdgeInsets.all(10),
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
                ));
          },
        ),
      )
    ]);
    ;
  }
}
