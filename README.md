# Supermarket Discount Engine

A Flutter-based demo project simulating a discount engine for a supermarket, built as a solution to `code_test_01`.

This app calculates the total purchase amount for a customer by applying the correct order of discounts and tax, following business rules and object-oriented programming principles.

---

## Specifications

- **Fixed discounts** are applied before **percentage discounts**
- **Product discounts** are applied before **overall discounts**
- An **11% VAT** is applied to every purchase
- **All discounts** are applied **before** tax

---

## Requirements Implemented

- ✅ All classes are defined using OOP principles:
  - Inheritance
  - Encapsulation
  - Abstraction
  - Polymorphism
- ✅ Mock methods serve as API calls for:
  - Customers
  - Items
  - Orders
  - Discounts
- ✅ A central logic calculates the total cost of purchase for a given list of items and a customer ID
- ✅ UI includes a button to simulate an order and display the total after applying discounts and VAT

---

## Features

- Product-level discounts (`FixedDiscount`, `PercentageDiscount`)
- Overall-level discounts (`OverallDiscount`) based on customer loyalty
- 11% VAT is calculated after all discounts
- Clean modular architecture using OOP and SOLID principles


