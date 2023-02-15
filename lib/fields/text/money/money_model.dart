import 'dart:math';

import 'package:dynamic_form/dynamic_form.dart';
import 'package:flutter/src/material/theme_data.dart';

class MoneyModel implements IFormFieldModel {
  @override
  final String id;

  @override
  String get key => '$runtimeType-$id';

  @override
  final bool hasTrigger;

  final String value;

  MoneyModel({
    required this.id,
    required this.value,
    required this.hasTrigger,
  });

  factory MoneyModel.fromMap(Map<String, dynamic> map) {
    return MoneyModel(
      value: '',
      hasTrigger: true,
      id: Random().nextInt(5000).toString(),
    );
  }

  @override
  MoneyModel copyWith({String? value}) {
    return MoneyModel(
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
    if (model is! MoneyModel) return this;
    if (model.key != key) return this;
    if (model.value == value) return this;
    return model;
  }

  @override
  String toString() => 'Money - $hashCode';

  @override
  // TODO: implement theme
  ThemeExtension<ThemeExtension> get theme => throw UnimplementedError();
}
