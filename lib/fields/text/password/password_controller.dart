import 'package:dynamic_form/dynamic_form.dart';
import 'package:flutter/material.dart';

import 'password_model.dart';

class PasswordController extends FormFieldController<PasswordModel> {
  final controller = TextEditingController();

  PasswordController(super.value);

  @override
  void whenModelIsChanged(PasswordModel newModel) {
    controller.text = newModel.value;

    super.whenModelIsChanged(newModel);
  }
}
