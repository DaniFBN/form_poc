import 'package:dynamic_form/dynamic_form.dart';
import 'package:flutter/material.dart';
import 'package:form_poc/fields/radio/radio_model.dart';

import 'radio_controller.dart';

class RadioFieldWidget extends FormFieldWidget {
  const RadioFieldWidget({
    super.key,
    required this.model,
  });

  @override
  final RadioModel model;

  @override
  State<RadioFieldWidget> createState() => _RadioFieldWidgetState();
}

class _RadioFieldWidgetState extends FormFieldWidgetState<RadioFieldWidget> {
  @override
  late final RadioController controller;

  @override
  void initState() {
    super.initState();

    controller = RadioController(widget.model);
  }

  @override
  Widget build(BuildContext context) {
    final dynamicFields = AppFieldsWidget.of(context);

    final fieldType = controller.model.field.runtimeType.toString();
    final dynamicModel = dynamicFields.get(fieldType);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(controller.model.key),
        for (String option in controller.model.options)
          RadioListTile(
            title: Text(option),
            value: option,
            groupValue: controller.model.value,
            onChanged: (value) {
              final newModel = controller.model.copyWith(value: value);

              DynamicFormWidget.of(context).trigger(formFieldModel: newModel);
            },
          ),
        if (controller.model.showChild)
          dynamicModel.widgetBuilderByModel(controller.model.field)
      ],
    );
  }
}
