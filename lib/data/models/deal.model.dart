import 'dart:convert';

class Deal {
  final int id;
  final String title;
  final int count;
  final String location;
  final int beforeDeal;
  final int afterDeal;
  Deal({
    required this.id,
    required this.title,
    required this.count,
    required this.location,
    required this.beforeDeal,
    required this.afterDeal,
  });

  Deal copyWith({
    int? id,
    String? title,
    int? count,
    String? location,
    int? beforeDeal,
    int? afterDeal,
  }) {
    return Deal(
      id: id ?? this.id,
      title: title ?? this.title,
      count: count ?? this.count,
      location: location ?? this.location,
      beforeDeal: beforeDeal ?? this.beforeDeal,
      afterDeal: afterDeal ?? this.afterDeal,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'count': count});
    result.addAll({'location': location});
    result.addAll({'beforeDeal': beforeDeal});
    result.addAll({'afterDeal': afterDeal});

    return result;
  }

  factory Deal.fromMap(Map<String, dynamic> map) {
    return Deal(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      count: map['count']?.toInt() ?? 0,
      location: map['location'] ?? '',
      beforeDeal: map['beforeDeal']?.toInt() ?? 0,
      afterDeal: map['afterDeal']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Deal.fromJson(String source) => Deal.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Deal(id: $id, title: $title, count: $count, location: $location, beforeDeal: $beforeDeal, afterDeal: $afterDeal)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Deal &&
        other.id == id &&
        other.title == title &&
        other.count == count &&
        other.location == location &&
        other.beforeDeal == beforeDeal &&
        other.afterDeal == afterDeal;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ count.hashCode ^ location.hashCode ^ beforeDeal.hashCode ^ afterDeal.hashCode;
  }
}
