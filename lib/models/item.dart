import '../utils/enums.dart';
import 'discount.dart';

class Item {
  final int id;
  final String name;
  final Category category;
  final DateTime? expiredTime;
  final StorageRequirement? storageRequirements;
  final Unit? unit;
  final Packaging? packaging;
  final AnimalType? animalSpecific;
  final int? warrantyLengthInMonths;
  final MaterialType? material;
  final double price;
  final List<ItemDiscount> discounts;

  Item({
    required this.id,
    required this.name,
    required this.category,
    this.expiredTime,
    this.storageRequirements,
    this.unit,
    this.packaging,
    this.animalSpecific,
    this.warrantyLengthInMonths,
    this.material,
    required this.price,
    required this.discounts,
  });
}

class ItemDiscount extends Discount {
  ItemDiscount({required super.type, required super.value});

  @override
  double apply(double amount) {
    switch (type) {
      case DiscountType.fixed:
        return amount - value;
      case DiscountType.percentage:
        return amount * (1 - value / 100);
    }
  }
}
