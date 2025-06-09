import '../utils/enums.dart';
import 'discount.dart';

class OrderItem {
  final int id;
  final int qty;
  final double price;
  final List<DiscountApplied> discountsApplied;

  OrderItem({
    required this.id,
    required this.qty,
    required this.price,
    required this.discountsApplied,
  });
}

class DiscountApplied {
  final DiscountType type;
  final double value;
  final double discountValue;

  DiscountApplied({
    required this.type,
    required this.value,
    required this.discountValue,
  });
}

class Order {
  final int id;
  final int customerId;
  final List<OrderItem> items;
  final DateTime date;
  final List<OverallDiscount> discountsApplied;
  final String status;

  Order({
    required this.id,
    required this.customerId,
    required this.items,
    required this.date,
    required this.discountsApplied,
    required this.status,
  });
}
