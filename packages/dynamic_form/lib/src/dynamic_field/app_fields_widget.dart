import 'package:flutter/material.dart';

import 'dynamic_field_model.dart';
import '../core/exceptions.dart';

class AppFieldsWidget extends InheritedWidget {
  const AppFieldsWidget({
    super.key,
    required super.child,
    required this.fields,
  });

  final Set<DynamicFieldModel> fields;

  DynamicFieldModel get(String fieldName) {
    final filteredFields = fields.where((e) => e.name == fieldName);

    if (filteredFields.isEmpty) {
      throw UnregisteredFieldException(
        message: "Field $fieldName isn't registered",
        stackTrace: StackTrace.current,
      );
    }

    final field = filteredFields.first;

    return field;
  }

  static AppFieldsWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppFieldsWidget>()!;
  }

  @override
  bool updateShouldNotify(AppFieldsWidget oldWidget) {
    return true;
  }
}
