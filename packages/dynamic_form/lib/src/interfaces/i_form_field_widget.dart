// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dynamic_form/dynamic_form.dart';
import 'package:flutter/material.dart';

abstract class IFormFieldWidget extends Widget {
  const IFormFieldWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final IFormFieldModel model;

}

