import 'dart:math';

import 'package:dynamic_form/dynamic_form.dart';
import 'package:flutter/src/material/theme_data.dart';

class PasswordModel implements IFormFieldModel {
  @override
  final String id;

  @override
  final bool hasTrigger;

  @override
  String get key => '$runtimeType-$id';

  final String value;

  PasswordModel({
    required this.id,
    required this.value,
    required this.hasTrigger,
  });

  factory PasswordModel.fromMap(Map<String, dynamic> map) {
    return PasswordModel(
      value: '',
      hasTrigger: true,
      id: Random().nextInt(5000).toString(),
    );
  }

  @override
  PasswordModel copyWith({String? value}) {
    return PasswordModel(
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
    if (model is! PasswordModel) return this;

    if (model.key != key) return this;
    if (model.value == value) return this;
    return model;
  }

  @override
  // TODO: implement theme
  ThemeExtension<ThemeExtension> get theme => throw UnimplementedError();
}
