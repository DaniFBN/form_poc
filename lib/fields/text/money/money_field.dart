import 'dart:math';

import 'package:dynamic_form/dynamic_form.dart';
import 'package:flutter/material.dart';
import 'package:form_poc/fields/text/money/money_controller.dart';

import 'money_model.dart';

class MoneyField extends StatefulWidget implements FormFieldWidget {
  @override
  final MoneyModel model;

  const MoneyField({super.key, required this.model});

  @override
  State<MoneyField> createState() => _MoneyFieldState();
}

class _MoneyFieldState extends FormFieldWidgetState<MoneyField> {
  @override
  late final MoneyController controller;

  @override
  void initState() {
    super.initState();

    controller = MoneyController(widget.model);
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (FormFieldState<dynamic> field) {
        return Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller.controller,
                decoration: const InputDecoration(
                  label: Text('MoneyField'),
                ),
              ),
            ),
            if (widget.model.hasTrigger)
              ElevatedButton(
                onPressed: () {
                  final randomInt = Random().nextInt(5000);
                  final newModel = widget.model.copyWith(
                    value: 'MoneyModel - $randomInt',
                  );
                  DynamicFormWidget.of(context)
                      .trigger(formFieldModel: newModel);
                },
                child: const Text('TRIGGER'),
              ),
          ],
        );
      },
    );
  }
}
