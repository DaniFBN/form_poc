import 'package:flutter/material.dart';

import 'form_field/i_form_field_model.dart';

class DynamicFormWidget
    extends InheritedNotifier<ValueNotifier<Iterable<IFormFieldModel>>> {
  DynamicFormWidget({
    super.key,
    required super.child,
    required Iterable<IFormFieldModel> fields,
  }) : super(notifier: ValueNotifier<Iterable<IFormFieldModel>>(fields));

  Iterable<IFormFieldModel> get fields => notifier!.value;

  void trigger({required IFormFieldModel formFieldModel}) {
    final newFields = notifier!.value.map((e) {
      return e.replaceModel(formFieldModel);
    });

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
