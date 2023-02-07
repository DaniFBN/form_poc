import 'dart:math';

import 'package:dynamic_form/dynamic_form.dart';

class PalmMoneyModel implements IFormFieldModel {
  @override
  final String id;

  @override
  String get key => '$runtimeType-$id';

  @override
  final bool hasTrigger;

  final String value;

  PalmMoneyModel({
    required this.id,
    required this.value,
    required this.hasTrigger,
  });

  factory PalmMoneyModel.fromMap(Map<String, dynamic> map) {
    return PalmMoneyModel(
      value: '',
      hasTrigger: true,
      id: Random().nextInt(5000).toString(),
    );
  }

  @override
  PalmMoneyModel copyWith({String? value}) {
    return PalmMoneyModel(
      value: value ?? this.value,
      hasTrigger: hasTrigger,
      id: id,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    throw UnimplementedError();
  }

  @override
  IFormFieldModel replaceModel(IFormFieldModel model) {
    if (model is! PalmMoneyModel) return this;
    if (model.key != key) return this;
    if (model.value == value) return this;
    return model;
  }

  @override
  String toString() => 'Money - $hashCode';
}
