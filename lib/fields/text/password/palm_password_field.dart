import 'dart:math';

import 'package:dynamic_form/dynamic_form.dart';
import 'package:flutter/material.dart';
import 'package:form_poc/fields/text/password/password_model.dart';

class PalmPasswordField extends StatefulWidget implements IFormFieldWidget {
  @override
  final PalmPasswordModel model;

  const PalmPasswordField({super.key, required this.model});

  @override
  State<PalmPasswordField> createState() => _PalmPasswordFieldState();
}

class _PalmPasswordFieldState extends State<PalmPasswordField> {
  late final TextEditingController controller;
  bool showPassword = false;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
  }

  @override
  void didUpdateWidget(covariant PalmPasswordField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.model != widget.model) {
      controller.value = TextEditingValue(text: widget.model.value);
    }
  }

  void toggleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            obscureText: showPassword,
            decoration: InputDecoration(
              label: const Text('PalmPasswordField'),
              suffixIcon: IconButton(
                onPressed: toggleShowPassword,
                icon: Icon(
                  showPassword ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
          ),
        ),
        if (widget.model.hasTrigger)
          ElevatedButton(
            onPressed: () {
              final randomInt = Random().nextInt(5000);
              final newModel = widget.model.copyWith(
                value: 'PalmPasswordModel - $randomInt',
              );
              DynamicFormWidget.of(context).trigger(formFieldModel: newModel);
            },
            child: const Text('TRIGGER'),
          ),
      ],
    );
  }
}
