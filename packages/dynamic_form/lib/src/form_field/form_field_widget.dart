import 'package:flutter/material.dart';

import 'form_field_controller.dart';
import 'i_form_field_model.dart';

abstract class FormFieldWidget extends StatefulWidget {
  const FormFieldWidget({super.key});

  IFormFieldModel get model;

  @override
  State<FormFieldWidget> createState();
}

abstract class FormFieldWidgetState<T extends FormFieldWidget>
    extends State<T> {
  FormFieldController get controller;

  @override
  void didUpdateWidget(covariant T oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.model == widget.model) return;
    controller.whenModelIsChanged(widget.model);
  }
}


// Field
//   DesignField - Divider, Label
//   FormField - TextField, Switch
