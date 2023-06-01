import 'dart:math';

import 'package:dynamic_form/dynamic_form.dart';
import 'package:flutter/material.dart';

import '../text/money/money_model.dart';

class RadioModel implements IFormFieldModel {
  @override
  final String id;

  @override
  String get key => '$runtimeType-$id';

  @override
  final bool hasTrigger;

  @override
  final String value;
  final Set<String> options;
  final IFormFieldModel field;
  final String condition;

  bool get showChild => value == condition;

  RadioModel({
    required this.id,
    required this.hasTrigger,
    required this.value,
    required this.options,
    required this.field,
    required this.condition,
  });

  factory RadioModel.fromMap(Map<String, dynamic> map) {
    return RadioModel(
      value: '',
      hasTrigger: true,
      id: Random().nextInt(5000).toString(),
      field: RadioModel(
        field: RadioModel(
          field: RadioModel(
            field: MoneyModel.fromMap({}),
            condition: 'sim',
            hasTrigger: true,
            id: Random().nextInt(5000).toString(),
            options: {'sim', 'nao'},
            value: '',
          ),
          condition: 'sim',
          hasTrigger: true,
          id: Random().nextInt(5000).toString(),
          options: {'sim', 'nao'},
          value: '',
        ),
        condition: 'sim',
        hasTrigger: true,
        id: Random().nextInt(5000).toString(),
        options: {'sim', 'nao'},
        value: '',
      ),
      options: {'sim', 'nao'},
      condition: 'sim',
    );
  }

  @override
  RadioModel copyWith({
    String? id,
    bool? hasTrigger,
    String? value,
    Set<String>? options,
    IFormFieldModel? field,
    String? condition,
  }) {
    return RadioModel(
      id: id ?? this.id,
      hasTrigger: hasTrigger ?? this.hasTrigger,
      value: value ?? this.value,
      options: options ?? this.options,
      field: field ?? this.field,
      condition: condition ?? this.condition,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    throw UnimplementedError();
  }

  @override
  IFormFieldModel replaceModel(IFormFieldModel model) {
    if (model.key != key) {
      final newField = field.replaceModel(model);
      return copyWith(field: newField);
    }
    if (model.value == value) return this;

    return model;
  }

  @override
  String toString() => 'Radio - $hashCode';

  @override
  ThemeExtension<ThemeExtension> get theme => throw UnimplementedError();
}
