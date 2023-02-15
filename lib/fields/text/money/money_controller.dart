import 'package:dynamic_form/dynamic_form.dart';
import 'package:flutter/material.dart';
import 'package:form_poc/fields/text/money/money_model.dart';

class MoneyController extends FormFieldController<MoneyModel> {
  final controller = TextEditingController();

  MoneyController(super.value);

  @override
  void whenModelIsChanged(MoneyModel newModel) {
    controller.text = newModel.value;

    super.whenModelIsChanged(newModel);
  }
}
