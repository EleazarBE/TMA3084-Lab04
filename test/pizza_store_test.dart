import 'package:flutter_test/flutter_test.dart';
import 'package:lab04/main.dart';

void main() {
  group('Pizza Store Widget Tests', () {
    testWidgets('Menu displays all three items', (tester) async {
      await tester.pumpWidget(const PizzaStoreApp());

      expect(find.text('Vegetable Pizza'), findsOneWidget);
      expect(find.text('Cheese Pizza'), findsOneWidget);
      expect(find.text('Box of Fries'), findsOneWidget);
    });

    testWidgets('Tapping a card opens its detail screen', (tester) async {
      await tester.pumpWidget(const PizzaStoreApp());

      await tester.tap(find.text('Vegetable Pizza'));
      await tester.pumpAndSettle();

      expect(find.text('Fresh vegetables, mushrooms, olives, capsicum and melted cheese.'), findsNothing);
      expect(
        find.textContaining('fresh vegetables'),
        findsOneWidget,
      );
      expect(find.text('Back to Menu'), findsOneWidget);
    });

    testWidgets('Back button returns to the menu', (tester) async {
      await tester.pumpWidget(const PizzaStoreApp());

      await tester.tap(find.text('Cheese Pizza'));
      await tester.pumpAndSettle();

      expect(find.text('Back to Menu'), findsOneWidget);

      await tester.tap(find.text('Back to Menu'));
      await tester.pumpAndSettle();

      expect(find.text('Pizza Store Menu'), findsOneWidget);
      expect(find.text('Vegetable Pizza'), findsOneWidget);
      expect(find.text('Box of Fries'), findsOneWidget);
    });
  });
}
