import 'package:demo_83/data/models/address.model.dart';
import 'package:demo_83/data/models/category.model.dart';
import 'package:demo_83/data/models/deal.model.dart';

import '../data/models/item.model.dart';

class DummyDataGenerator {
  late final List<Address> addresses;
  late final List<Category> categories;
  late final List<Deal> deals;
  late final List<Item> cartItems;

  DummyDataGenerator() {
    addresses = List<Address>.from(
      (_DummyDataHolder.addressJsonData.map((element) => Address.fromMap(element))).toList(),
    );
    categories = List<Category>.from(
      (_DummyDataHolder.categoriesJsonData.map((element) => Category.fromMap(element))).toList(),
    );
    deals = List<Deal>.from(
      (_DummyDataHolder.dealsJsonData.map((element) => Deal.fromMap(element))).toList(),
    );
    cartItems = List<Item>.from(
      (_DummyDataHolder.cartItemsJsonData.map((element) => Item.fromMap(element))).toList(),
    );
  }
}

class _DummyDataHolder {
  static const addressJsonData = [
    {
      "id": 1,
      "name": "Home Address",
      "area": "",
      "street": "Mustafa St.",
      "type": 1,
      "buildingNo": 2,
      "floor": 12,
      "unitNo": 122,
    },
    {
      "id": 2,
      "name": "Office Address",
      "area": "Axis Stanbul",
      "street": "Mustafa St.",
      "type": 0,
      "buildingNo": 2,
      "floor": 2,
      "unitNo": 11,
    },
    {
      "id": 3,
      "name": "Oxford",
      "area": "Oxford",
      "street": "Oxford Street",
      "type": 1,
      "buildingNo": 2,
      "floor": 12,
      "unitNo": 0,
    },
  ];
  static const categoriesJsonData = [
    {
      "id": 1,
      "name": "Steak",
    },
    {
      "id": 2,
      "name": "Vegetables",
    },
    {
      "id": 3,
      "name": "Beverages",
    },
    {
      "id": 4,
      "name": "Fish",
    },
    {
      "id": 5,
      "name": "Juice",
    },
    {
      "id": 6,
      "name": "Pizza",
    },
  ];
  static const dealsJsonData = [
    {
      "id": 1,
      "title": "Summer Sun Ice Cream Pack",
      "count": 5,
      "location": "15 Minutes Away",
      "beforeDeal": 18,
      "afterDeal": 12,
    },
    {
      "id": 2,
      "title": "Summer Sun Ice Cream Pack",
      "count": 5,
      "location": "15 Minutes Away",
      "beforeDeal": 18,
      "afterDeal": 12,
    },
  ];
  static const cartItemsJsonData = [
    {
      "id": 1,
      "name": "Turkish Steak",
      "count": 1,
      "weight": 173,
      "weightUnit": "Grams",
      "price": 25,
    },
    {
      "id": 2,
      "name": "Salmon",
      "count": 1,
      "weight": 2,
      "weightUnit": "Serving",
      "price": 30,
    },
    {
      "id": 3,
      "name": "Red Juice",
      "count": 1,
      "weight": 1,
      "weightUnit": "Bottle",
      "price": 25,
    },
    {
      "id": 4,
      "name": "Cola",
      "count": 1,
      "weight": 1,
      "weightUnit": "Bottle",
      "price": 11,
    },
  ];
}
