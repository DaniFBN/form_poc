import 'dart:math';

import 'package:dynamic_form/dynamic_form.dart';
import 'package:flutter/material.dart';

import 'password_controller.dart';
import 'password_model.dart';

class PasswordField extends StatefulWidget implements FormFieldWidget {
  @override
  final PasswordModel model;

  const PasswordField({super.key, required this.model});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends FormFieldWidgetState<PasswordField> {
  @override
  late final PasswordController controller;

  bool showPassword = false;

  @override
  void initState() {
    super.initState();

    controller = PasswordController(widget.model);
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
            controller: controller.controller,
            obscureText: showPassword,
            decoration: InputDecoration(
              label: const Text('PasswordField'),
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
                value: 'PasswordModel - $randomInt',
              );
              DynamicFormWidget.of(context).trigger(formFieldModel: newModel);
            },
            child: const Text('TRIGGER'),
          ),
      ],
    );
  }
}
