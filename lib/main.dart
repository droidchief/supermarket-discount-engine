import 'package:code_test_1/services/discount_engine.dart';
import 'package:code_test_1/services/mock_api_service.dart';
import 'package:flutter/material.dart';

import 'models/item.dart';

void main() async {
  final api = MockApiService();
  final engine = DiscountEngine(api);

  final customer = (await api.getCustomers()).first;
  final items = await api.getItems();

  // Mock a selection of items to simulate a user order
  final selectedItems =
      items
          .map(
            (item) => Item(
              id: item.id,
              name: item.name,
              category: item.category,
              price: item.price,
              discounts: item.discounts,
            ),
          )
          .toList();

  final total = await engine.calculateTotal(customer.id, selectedItems);

  debugPrint(
    'Total for customer ${customer.name} is: ₦${total.toStringAsFixed(2)}',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Supermarket Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Center(
        child: Text("Check console for result", textAlign: TextAlign.center),
      ),
    );
  }
}
