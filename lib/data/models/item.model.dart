import 'dart:convert';

class Item {
  final int id;
  final String name;
  int count;
  final int weight;
  final String weightUnit;
  final int price;
  Item({
    required this.id,
    required this.name,
    required this.count,
    required this.weight,
    required this.weightUnit,
    required this.price,
  });

  Item copyWith({
    int? id,
    String? name,
    int? count,
    int? weight,
    String? weightUnit,
    int? price,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      count: count ?? this.count,
      weight: weight ?? this.weight,
      weightUnit: weightUnit ?? this.weightUnit,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'count': count});
    result.addAll({'weight': weight});
    result.addAll({'weightUnit': weightUnit});
    result.addAll({'price': price});

    return result;
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      count: map['count']?.toInt() ?? 0,
      weight: map['weight']?.toInt() ?? 0,
      weightUnit: map['weightUnit'] ?? '',
      price: map['price']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, count: $count, weight: $weight, weightUnit: $weightUnit, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.count == count &&
        other.weight == weight &&
        other.weightUnit == weightUnit &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ count.hashCode ^ weight.hashCode ^ weightUnit.hashCode ^ price.hashCode;
  }
}
