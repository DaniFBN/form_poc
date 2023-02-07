import 'package:dynamic_form/dynamic_form.dart';
import 'package:flutter/material.dart';
import 'package:form_poc/fields/text/password/palm_password_field.dart';
import 'package:form_poc/fields/text/password/password_model.dart';

import 'fields/table/table_model.dart';
import 'fields/table/table_widget.dart';
import 'fields/text/money/palm_money_field.dart';
import 'fields/text/money/palm_money_model.dart';

class TestPackage extends StatelessWidget {
  TestPackage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Page model'),
      ),
      body: DynamicFieldsWidget(
        fields: mockFields,
        child: Builder(builder: (context) {
          final dynamicFields = DynamicFieldsWidget.of(context);

          final dynamicFormFields = mock.map((e) {
            final field = dynamicFields.get(e['type'] as String);
            final model = field.modelFromMapBuilder(e);

            return model;
          }).toList();

          return DynamicFormWidget(
            fields: dynamicFormFields,
            child: Builder(builder: (context) {
              final dynamicForm = DynamicFormWidget.of(context);

              return ListView.separated(
                itemCount: dynamicForm.fields.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final model = dynamicForm.fields.elementAt(index);

                  final field = dynamicFields.get(model.runtimeType.toString());
                  return field.widgetBuilderByModel(model);
                },
              );
            }),
          );
        }),
      ),
    );
  }
}

const mock = [
  {'type': 'PalmPasswordModel'},
  {'type': 'PalmMoneyModel'},
  {'type': 'PalmTableModel'},
  {'type': 'PalmPasswordModel'},
  {'type': 'PalmMoneyModel'},
  {'type': 'PalmTableModel'},
];

final mockFields = {
  DynamicFieldModel(
    name: 'PalmPasswordModel',
    modelFromMapBuilder: PalmPasswordModel.fromMap,
    widgetBuilderByModel: (IFormFieldModel model) {
      return PalmPasswordField(model: model as PalmPasswordModel);
    },
  ),
  DynamicFieldModel(
    name: 'PalmMoneyModel',
    modelFromMapBuilder: PalmMoneyModel.fromMap,
    widgetBuilderByModel: (IFormFieldModel model) {
      return PalmMoneyField(model: model as PalmMoneyModel);
    },
  ),
  DynamicFieldModel(
    name: 'PalmTableModel',
    modelFromMapBuilder: PalmTableModel.fromMap,
    widgetBuilderByModel: (IFormFieldModel model) {
      return PalmTableField(model: model as PalmTableModel);
    },
  ),
};
