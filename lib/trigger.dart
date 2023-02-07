import 'package:flutter/cupertino.dart';
import 'package:form_poc/interfaces/form_field_model.dart';

class Trigger extends InheritedNotifier<ValueNotifier<List<IFormFieldModel>>> {
  Trigger({
    super.key,
    required super.child,
    required List<IFormFieldModel> models,
  }) : super(notifier: ValueNotifier<List<IFormFieldModel>>(models));

  void triggerField({required IFormFieldModel formFieldModel}) {
    final oldFields = notifier!.value;

    final newFields = oldFields.map((e) {
      return e.replaceModel(formFieldModel);
    }).toList();
    notifier!.value = newFields;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static Trigger of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Trigger>()!;
  }
}
