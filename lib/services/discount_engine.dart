import '../models/item.dart';
import '../models/order.dart';
import '../utils/enums.dart';
import 'mock_api_service.dart';

class DiscountEngine {
  final MockApiService api;

  DiscountEngine(this.api);

  Future<double> calculateTotal(int customerId, List<Item> items) async {
    final orders = await api.getOrdersByCustomer(customerId);
    final overallDiscounts = await api.getDiscounts();

    double subtotal = 0.0;

    for (final item in items) {
      double itemPrice = item.price;

      // Apply item discounts: fixed first, then percentage
      final fixed = item.discounts.where((d) => d.type == DiscountType.fixed);
      final percent = item.discounts.where(
        (d) => d.type == DiscountType.percentage,
      );

      for (final d in fixed) {
        itemPrice = d.apply(itemPrice);
      }
      for (final d in percent) {
        itemPrice = d.apply(itemPrice);
      }

      subtotal += itemPrice;
    }

    // Apply overall discounts
    double total = subtotal;

    for (final discount in overallDiscounts) {
      if (discount.category == DiscountCategory.loyalty) {
        if (discount.loyaltyDiscountCriteria == LoyaltyCriteria.orderCount &&
            orders.length >= discount.loyaltyDiscountCriteriaValue!) {
          total = discount.apply(total);
        }
      }
    }

    // Apply VAT after discounts
    total *= 1.11;

    return total;
  }

  double _orderTotal(Order order) {
    return order.items.fold(0.0, (prev, e) => prev + (e.price * e.qty));
  }
}
