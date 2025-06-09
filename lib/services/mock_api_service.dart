import '../models/customer.dart';
import '../models/discount.dart';
import '../models/item.dart';
import '../models/order.dart';
import '../utils/enums.dart';

class MockApiService {
  Future<List<Item>> getItems() async {
    return [
      Item(
        id: 1,
        name: "Milk",
        category: Category.groceries,
        price: 2000.0,
        discounts: [ItemDiscount(type: DiscountType.fixed, value: 200)],
      ),
    ];
  }

  Future<List<OverallDiscount>> getDiscounts() async {
    return [
      OverallDiscount(
        type: DiscountType.percentage,
        value: 5,
        category: DiscountCategory.loyalty,
        loyaltyDiscountCriteria: LoyaltyCriteria.orderCount,
        loyaltyDiscountCriteriaValue: 3,
      ),
    ];
  }

  Future<List<Customer>> getCustomers() async {
    return [Customer(id: 1, name: "Victor")];
  }

  Future<List<Order>> getOrdersByCustomer(int customerId) async {
    return [];
  }
}
