import 'package:dynamic_form/dynamic_form.dart';
import 'package:flutter/material.dart';
import 'package:form_poc/fields/text/password/password_field.dart';
import 'package:form_poc/fields/text/password/password_model.dart';

import 'fields/table/table_model.dart';
import 'fields/table/table_widget.dart';
import 'fields/text/money/money_field.dart';
import 'fields/text/money/money_model.dart';

class TestPackage extends StatefulWidget {
  const TestPackage({super.key});

  @override
  State<TestPackage> createState() => _TestPackageState();
}

class _TestPackageState extends State<TestPackage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Page model'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppFieldsWidget(
          fields: mockFields,
          child: Builder(
            builder: (context) {
              final dynamicFields = AppFieldsWidget.of(context);

              final dynamicFormFields = mock.map((e) {
                final field = dynamicFields.get(e['type'] as String);
                final model = field.modelFromMapBuilder(e);

                return model;
              }).toList();

              return DynamicFormWidget(
                fields: dynamicFormFields,
                child: Builder(
                  builder: (context) {
                    final dynamicForm = DynamicFormWidget.of(context);

                    return ListView.separated(
                      itemCount: dynamicForm.fields.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final model = dynamicForm.fields.elementAt(index);

                        final name = model.runtimeType.toString();
                        final field = dynamicFields.get(name);
                        return field.widgetBuilderByModel(model);
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

const mock = [
  {'type': 'PasswordModel'},
  {'type': 'MoneyModel'},
  {'type': 'TableModel'},
  {'type': 'PasswordModel'},
  {'type': 'MoneyModel'},
  {'type': 'TableModel'},
];

final mockFields = {
  DynamicFieldModel(
    name: 'PasswordModel',
    modelFromMapBuilder: PasswordModel.fromMap,
    widgetBuilderByModel: (IFormFieldModel model) {
      return PasswordField(model: model as PasswordModel);
    },
  ),
  DynamicFieldModel(
    name: 'MoneyModel',
    modelFromMapBuilder: MoneyModel.fromMap,
    widgetBuilderByModel: (IFormFieldModel model) {
      return MoneyField(model: model as MoneyModel);
    },
  ),
  DynamicFieldModel(
    name: 'TableModel',
    modelFromMapBuilder: TableModel.fromMap,
    widgetBuilderByModel: (IFormFieldModel model) {
      return TableField(model: model as TableModel);
    },
  ),
};



// Fazer o dynamicForm extends do Form basico
// Sendo assim
// Eu terei o metodo save para atualizar os objetos no topo, mas não rebuildar
// E validate pro form
// E acrescentar o metodo trigger que vai receber o model que gatilhou
// Fazendo a lógica e consequentemente provacando um setState na arvore
