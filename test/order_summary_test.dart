import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab04/order_summary.dart';

void main() {
  testWidgets('Order summary displays correct item and total',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: OrderSummaryScreen(
          itemName: 'Cheese Pizza',
          unitPrice: 5.00,
          quantity: 5,
        ),
      ),
    );

    expect(find.text('Order Summary'), findsOneWidget);
    expect(find.text('Item: Cheese Pizza'), findsOneWidget);
    expect(find.text('Quantity: 5'), findsOneWidget);
    expect(find.text('Total Price: RM 25.00'), findsOneWidget);
    expect(find.text('Back'), findsOneWidget);
  });
}
