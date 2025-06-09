import '../utils/enums.dart';

abstract class Discount {
  final DiscountType type;
  final double value;

  Discount({required this.type, required this.value});

  double apply(double amount);
}

class FixedDiscount extends Discount {
  FixedDiscount({required super.value}) : super(type: DiscountType.fixed);

  @override
  double apply(double amount) => amount - value;
}

class PercentageDiscount extends Discount {
  PercentageDiscount({required super.value})
    : super(type: DiscountType.percentage);

  @override
  double apply(double amount) => amount * (1 - value / 100);
}

class OverallDiscount extends Discount {
  final DiscountCategory category;
  final LoyaltyCriteria? loyaltyDiscountCriteria;
  final double? loyaltyDiscountCriteriaValue;

  OverallDiscount({
    required super.type,
    required super.value,
    required this.category,
    this.loyaltyDiscountCriteria,
    this.loyaltyDiscountCriteriaValue,
  });

  @override
  double apply(double amount) {
    return type == DiscountType.percentage
        ? amount * (1 - value / 100)
        : amount - value;
  }
}
