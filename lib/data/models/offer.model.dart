import 'dart:convert';

class Offer {
  final int id;
  final String title;
  final int beforeDeal;
  final int afterDeal;
  final DateTime expirationDate;
  Offer({
    required this.id,
    required this.title,
    required this.beforeDeal,
    required this.afterDeal,
    required this.expirationDate,
  });

  Offer copyWith({
    int? id,
    String? title,
    int? beforeDeal,
    int? afterDeal,
    DateTime? expirationDate,
  }) {
    return Offer(
      id: id ?? this.id,
      title: title ?? this.title,
      beforeDeal: beforeDeal ?? this.beforeDeal,
      afterDeal: afterDeal ?? this.afterDeal,
      expirationDate: expirationDate ?? this.expirationDate,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'beforeDeal': beforeDeal});
    result.addAll({'afterDeal': afterDeal});
    result.addAll({'expirationDate': expirationDate.millisecondsSinceEpoch});

    return result;
  }

  factory Offer.fromMap(Map<String, dynamic> map) {
    return Offer(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      beforeDeal: map['beforeDeal']?.toInt() ?? 0,
      afterDeal: map['afterDeal']?.toInt() ?? 0,
      expirationDate: DateTime.parse(map['expirationDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Offer.fromJson(String source) => Offer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Offer(id: $id, title: $title, beforeDeal: $beforeDeal, afterDeal: $afterDeal, expirationDate: $expirationDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Offer &&
        other.id == id &&
        other.title == title &&
        other.beforeDeal == beforeDeal &&
        other.afterDeal == afterDeal &&
        other.expirationDate == expirationDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ beforeDeal.hashCode ^ afterDeal.hashCode ^ expirationDate.hashCode;
  }
}
