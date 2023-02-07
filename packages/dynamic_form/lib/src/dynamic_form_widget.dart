import 'package:flutter/material.dart';

import 'interfaces/i_form_field_model.dart';

class DynamicFormWidget
    extends InheritedNotifier<ValueNotifier<List<IFormFieldModel>>> {
  DynamicFormWidget({
    super.key,
    required super.child,
    required List<IFormFieldModel> fields,
  }) : super(notifier: ValueNotifier<List<IFormFieldModel>>(fields));

  List<IFormFieldModel> get fields => notifier!.value;

  void trigger({required IFormFieldModel formFieldModel}) {
    final oldFields = notifier!.value;

    final newFields = oldFields.map((e) {
      return e.replaceModel(formFieldModel);
    }).toList();
    notifier!.value = newFields;
  }

  static DynamicFormWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DynamicFormWidget>()!;
  }

  @override
  bool updateShouldNotify(DynamicFormWidget oldWidget) {
    return true;
  }
}
