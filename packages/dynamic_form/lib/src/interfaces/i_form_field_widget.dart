import 'package:flutter/material.dart';

import 'i_form_field_model.dart';

abstract class IFormFieldWidget<String> extends Widget {
  final IFormFieldModel model;

  const IFormFieldWidget({required this.model, super.key});
}
