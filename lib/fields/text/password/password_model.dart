import 'dart:math';

import 'package:dynamic_form/dynamic_form.dart';

class PalmPasswordModel implements IFormFieldModel {
  @override
  final String id;

  @override
  final bool hasTrigger;

  @override
  String get key => '$runtimeType-$id';

  final String value;

  PalmPasswordModel({
    required this.id,
    required this.value,
    required this.hasTrigger,
  });

  factory PalmPasswordModel.fromMap(Map<String, dynamic> map) {
    return PalmPasswordModel(
      value: '',
      hasTrigger: true,
      id: Random().nextInt(5000).toString(),
    );
  }

  @override
  PalmPasswordModel copyWith({String? value}) {
    return PalmPasswordModel(
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
  IFormFieldModel? findModelByKey(String keyValue) {
    if (key == keyValue) return this;
    return null;
  }

  @override
  IFormFieldModel replaceModel(IFormFieldModel model) {
    if (model is! PalmPasswordModel) return this;

    if (model.key != key) return this;
    if (model.value == value) return this;
    return model;
  }
}
