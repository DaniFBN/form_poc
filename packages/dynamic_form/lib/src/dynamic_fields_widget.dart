import 'package:flutter/material.dart';

import 'dynamic_field_model.dart';

class DynamicFieldsWidget extends InheritedWidget {
  const DynamicFieldsWidget({
    super.key,
    required this.child,
    required this.fields,
  }) : super(child: child);

  @override
  final Widget child;

  final List<DynamicFieldModel> fields;

  static DynamicFieldsWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DynamicFieldsWidget>();
  }

  @override
  bool updateShouldNotify(DynamicFieldsWidget oldWidget) {
    return true;
  }
}
