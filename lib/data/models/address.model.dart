import 'dart:convert';

enum BuildingType {
  office,
  apartment,
}

class Address {
  final int id;
  final String name;
  final String area;
  final String street;
  final BuildingType type;
  final int buildingNo;
  final int floor;
  final int unitNo;
  Address({
    required this.id,
    required this.name,
    required this.area,
    required this.street,
    required this.type,
    required this.buildingNo,
    required this.floor,
    required this.unitNo,
  });

  Address copyWith({
    int? id,
    String? name,
    String? area,
    String? street,
    BuildingType? type,
    int? buildingNo,
    int? floor,
    int? unitNo,
  }) {
    return Address(
      id: id ?? this.id,
      name: name ?? this.name,
      area: area ?? this.area,
      street: street ?? this.street,
      type: type ?? this.type,
      buildingNo: buildingNo ?? this.buildingNo,
      floor: floor ?? this.floor,
      unitNo: unitNo ?? this.unitNo,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'area': area});
    result.addAll({'street': street});
    result.addAll({'type': type.toString()});
    result.addAll({'buildingNo': buildingNo});
    result.addAll({'floor': floor});
    result.addAll({'unitNo': unitNo});

    return result;
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      area: map['area'] ?? '',
      street: map['street'] ?? '',
      type: BuildingType.values[map['type']],
      buildingNo: map['buildingNo']?.toInt() ?? 0,
      floor: map['floor']?.toInt() ?? 0,
      unitNo: map['unitNo']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) => Address.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Address(id: $id, name: $name, area: $area, street: $street, type: $type, buildingNo: $buildingNo, floor: $floor, unitNo: $unitNo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Address &&
        other.id == id &&
        other.name == name &&
        other.area == area &&
        other.street == street &&
        other.type == type &&
        other.buildingNo == buildingNo &&
        other.floor == floor &&
        other.unitNo == unitNo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        area.hashCode ^
        street.hashCode ^
        type.hashCode ^
        buildingNo.hashCode ^
        floor.hashCode ^
        unitNo.hashCode;
  }
}
