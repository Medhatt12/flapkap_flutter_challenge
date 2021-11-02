import 'package:flapkap_flutter_challenge/providers/order.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //Given When Then Test Naming
  test(
      'Given order with status returned when numberOfReturns is called order is added',
      () async {
        //ARRANGE
    final order = Order(
        id: '123',
        isActive: true,
        price: 554.4,
        company: 'Some Company',
        pictureUrl: 'http://placehold.it/32x32',
        buyer: 'Mohamed Medhat',
        tags: ['#test', 'WidgetTest', '#UnitTest'],
        status: 'RETURNED',
        registeredDate: DateTime.now());

        //ACT


        //ASSERT
  });
}
