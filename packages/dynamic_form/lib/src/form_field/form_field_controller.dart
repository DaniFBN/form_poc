import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../dynamic_form.dart';

class FormFieldController<T extends IFormFieldModel>  {
  T model;
  FormFieldController(this.model);

  @mustCallSuper
  FutureOr<void> whenModelIsChanged(T newModel) {
    _updateModel(newModel);
  }

  void _updateModel(T newModel) {
    model = newModel;
  }
}
