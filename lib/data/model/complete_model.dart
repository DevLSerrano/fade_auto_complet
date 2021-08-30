import 'dart:convert';

class CompleteModel {
  final int? id;
  final String value;

  CompleteModel({this.id, required this.value});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'value': value,
    };
  }

  factory CompleteModel.fromMap(Map<String, dynamic> map) {
    return CompleteModel(
      id: map['id'],
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CompleteModel.fromJson(String source) => CompleteModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CompleteModel && other.id == id && other.value == value;
  }

  @override
  int get hashCode => id.hashCode ^ value.hashCode;

  @override
  String toString() => 'CompleteModel(id: $id, value: $value)';
}
