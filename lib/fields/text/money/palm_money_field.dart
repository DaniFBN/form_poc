import 'package:flutter/material.dart';
import 'package:form_poc/fields/text/money/palm_money_model.dart';

import '../../../interfaces/form_field_widget.dart';
import '../../../trigger.dart';
import 'palm_money_style.dart';

class PalmMoneyField extends StatefulWidget implements IFormFieldWidget {
  @override
  final PalmMoneyModel model;

  const PalmMoneyField({super.key, required this.model});

  @override
  State<PalmMoneyField> createState() => _PalmMoneyFieldState();
}

class _PalmMoneyFieldState extends State<PalmMoneyField> {
  late final FocusNode focus;
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.model.initialValue);
    focus = FocusNode();

    // focus.addListener(focusListener);
  }

  @override
  void didUpdateWidget(covariant PalmMoneyField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.model != widget.model) {
      controller.value = TextEditingValue(text: widget.model.value);
    }
  }

  // void focusListener() {
  //   if (!focus.hasFocus) {
  //     Trigger.of(context).triggerField(
  //       formFieldModel: widget.model.copyWith(
  //         value: 'PalmMoneyModel - TESTE',
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final style = PalmMoneyStyle.of(context);

    return FormField(
      initialValue: widget.model.initialValue,
      validator: widget.model.validator,
      builder: (FormFieldState<dynamic> field) {
        if (!field.isValid && field.errorText != null) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: style.errorColor,
                content: Text('Error PalmMoneyField ${field.errorText}'),
              ),
            );
          });
        }
        return Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                focusNode: focus,
                decoration: const InputDecoration(
                  label: Text('PalmMoneyField'),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final newModel = widget.model.copyWith(
                  value: 'PalmMoneyModel - TESTE',
                );
                Trigger.of(context).triggerField(formFieldModel: newModel);
              },
              child: const Text('TRIGGER'),
            ),
          ],
        );
      },
    );
  }
}
