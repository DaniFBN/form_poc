import 'package:flutter/material.dart';

import 'dynamic_field_model.dart';

class DynamicFieldsWidget extends InheritedWidget {
  const DynamicFieldsWidget({
    super.key,
    required super.child,
    required this.fields,
  });

  final Set<DynamicFieldModel> fields;

  DynamicFieldModel get(String fieldName) {
    final filteredFields = fields.where((e) => e.name == fieldName);

    if (filteredFields.isEmpty) throw '';

    final field = filteredFields.first;

    return field;
  }

  static DynamicFieldsWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DynamicFieldsWidget>()!;
  }

  @override
  bool updateShouldNotify(DynamicFieldsWidget oldWidget) {
    return true;
  }
}
