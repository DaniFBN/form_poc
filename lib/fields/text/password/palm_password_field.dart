import 'package:flutter/material.dart';
import 'package:form_poc/fields/text/password/password_model.dart';

import '../../../interfaces/form_field_widget.dart';

class PalmPasswordField extends StatefulWidget implements IFormFieldWidget {
  @override
  final PalmPasswordModel model;

  const PalmPasswordField({super.key, required this.model});

  @override
  State<PalmPasswordField> createState() => _PalmPasswordFieldState();
}

class _PalmPasswordFieldState extends State<PalmPasswordField> {
  bool showPassword = false;

  void toggleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: widget.model.validator,
      builder: (FormFieldState<dynamic> field) {
        if (!field.isValid && field.errorText != null) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error PalmPasswordField ${field.errorText}'),
              ),
            );
          });
        }

        return TextField(
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
        );
      },
    );
  }
}
