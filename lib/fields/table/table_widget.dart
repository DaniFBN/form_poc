import 'package:flutter/material.dart';
import 'package:form_poc/fields/table/table_model.dart';

import '../../interfaces/form_field_widget.dart';
import '../../resolver.dart';

class TableWidget extends StatelessWidget implements IFormFieldWidget {
  @override
  final PalmTableModel model;

  const TableWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgetFields = model.fields.map(
      (e) =>
          Resolver.getFieldByModel(e.runtimeType.toString()).builder(model: e),
    );
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: widgetFields.toList(),
        ),
      ),
    );
  }
}
