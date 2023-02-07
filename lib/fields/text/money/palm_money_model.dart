// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import '../../../interfaces/form_field_model.dart';

class PalmMoneyModel implements IFormFieldModel {
  @override
  final String id;

  @override
  final String initialValue;

  @override
  final bool isEditable;

  @override
  final String name;

  @override
  final String value;

  @override
  final String? Function(String?) validator;

  @override
  String get key => '$runtimeType-$id-$name';

  PalmMoneyModel({
    required this.id,
    required this.initialValue,
    required this.isEditable,
    required this.name,
    required this.value,
    required this.validator,
  });

  factory PalmMoneyModel.fromMap(Map<String, dynamic> map) {
    return PalmMoneyModel(
      initialValue: '',
      isEditable: false,
      name: '',
      value: '',
      validator: (_) => null,
      id: Random().nextInt(5000).toString(),
    );
  }

  @override
  PalmMoneyModel copyWith({String? value}) {
    return PalmMoneyModel(
      initialValue: initialValue,
      isEditable: isEditable,
      name: name,
      value: value ?? this.value,
      validator: validator,
      id: id,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    throw UnimplementedError();
  }

  @override
  IFormFieldModel? findModelByKey(String keyValue) {
    if (key == keyValue) return this;
    return null;
  }

  @override
  IFormFieldModel replaceModel(IFormFieldModel model) {
    if (model.key != key) return this;
    if (model.value == value) return this;
    return model;
  }

  @override
  String toString() => 'Money - $hashCode';
}
