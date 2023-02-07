import 'dart:math';

import 'package:dynamic_form/dynamic_form.dart';
import 'package:flutter/material.dart';
import 'package:form_poc/fields/text/money/palm_money_model.dart';

class PalmMoneyField extends StatefulWidget implements IFormFieldWidget {
  @override
  final PalmMoneyModel model;

  const PalmMoneyField({super.key, required this.model});

  @override
  State<PalmMoneyField> createState() => _PalmMoneyFieldState();
}

class _PalmMoneyFieldState extends State<PalmMoneyField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
  }

  @override
  void didUpdateWidget(covariant PalmMoneyField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.model != widget.model) {
      controller.value = TextEditingValue(text: widget.model.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              label: Text('PalmMoneyField'),
            ),
          ),
        ),
        if (widget.model.hasTrigger)
          ElevatedButton(
            onPressed: () {
              final randomInt = Random().nextInt(5000);
              final newModel = widget.model.copyWith(
                value: 'PalmMoneyModel - $randomInt',
              );
              DynamicFormWidget.of(context).trigger(formFieldModel: newModel);
            },
            child: const Text('TRIGGER'),
          ),
      ],
    );
  }
}
