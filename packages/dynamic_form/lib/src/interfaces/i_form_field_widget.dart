// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dynamic_form/dynamic_form.dart';
import 'package:flutter/material.dart';

abstract class IFormFieldWidget extends StatefulWidget {
  const IFormFieldWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final IFormFieldModel model;

  @override
  State<IFormFieldWidget> createState() => _IFormFieldWidgetState();
}

class _IFormFieldWidgetState extends State<IFormFieldWidget> {
  // String value;

  // @override
  // void initState() {
  //   super.initState();

  //   value = '';
  // }

  // @override
  // void didUpdateWidget(covariant IFormFieldWidget oldWidget) {
  //   super.didUpdateWidget(oldWidget);

  //   if (oldWidget.model != widget.model) {
  //     value = widget.model.value;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
