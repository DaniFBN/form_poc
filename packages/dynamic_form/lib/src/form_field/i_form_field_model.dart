import 'package:flutter/material.dart';

abstract class IFormFieldModel implements IFieldModel {
  @override
  String get id;

  @override
  String get key;

  bool get hasTrigger;

  Map<String, dynamic> toMap();
  IFormFieldModel replaceModel(IFormFieldModel model);
  IFormFieldModel copyWith({String? value});
}

abstract class IDesignFieldModel {
  String get id;
  String get key;
}

abstract class IActionFieldModel {
  String get id;
  String get key;
  void Function() get onPressed;
}

abstract class IFieldModel {
  String get id;
  String get key;

  ThemeExtension get theme;
}
