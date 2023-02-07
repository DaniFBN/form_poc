import 'package:dynamic_form/dynamic_form.dart';
import 'package:flutter/material.dart';
import 'package:form_poc/fields/table/table_model.dart';

class PalmTableField extends StatefulWidget implements IFormFieldWidget {
  @override
  final PalmTableModel model;

  const PalmTableField({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<PalmTableField> createState() => _PalmTableFieldState();
}

class _PalmTableFieldState extends State<PalmTableField> {
  @override
  Widget build(BuildContext context) {
    final dynamicFields = DynamicFieldsWidget.of(context);
    final widgetFields = widget.model.fields.map(
      (fieldModel) {
        final fieldType = fieldModel.runtimeType.toString();
        final dynamicModel = dynamicFields.get(fieldType);
        return dynamicModel.widgetBuilderByModel(fieldModel);
      },
    ).toList();

    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('PalmTableField'),
            ...widgetFields,
          ],
        ),
      ),
    );
  }
}
