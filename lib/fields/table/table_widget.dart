// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dynamic_form/dynamic_form.dart';
import 'package:flutter/material.dart';

import 'table_controller.dart';
import 'table_model.dart';

class TableField extends FormFieldWidget {
  @override
  final TableModel model;

  const TableField({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<TableField> createState() => _TableFieldState();
}

class _TableFieldState extends FormFieldWidgetState<TableField> {
  @override
  late final TableController controller;

  @override
  void initState() {
    super.initState();

    controller = TableController(widget.model);
  }

  @override
  Widget build(BuildContext context) {
    final dynamicFields = AppFieldsWidget.of(context);
    final widgetFields = controller.model.fields.map(
      (fieldModel) {
        final fieldType = fieldModel.runtimeType.toString();
        final dynamicModel = dynamicFields.get(fieldType);
        return dynamicModel.widgetBuilderByModel(fieldModel);
      },
    ).toList();

    return Card(
      elevation: controller.model.theme.elevation,
      color: controller.model.theme.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('TableField'),
            ...widgetFields,
          ],
        ),
      ),
    );
  }
}

class TableStyle extends ThemeExtension<TableStyle> {
  final Color backgroundColor;
  final double elevation;

  const TableStyle(
    this.backgroundColor,
    this.elevation,
  );

  @override
  ThemeExtension<TableStyle> copyWith() {
    throw UnimplementedError();
  }

  @override
  ThemeExtension<TableStyle> lerp(ThemeExtension<TableStyle>? other, double t) {
    throw UnimplementedError();
  }
}
