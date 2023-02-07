import 'dart:math';

import '../../../interfaces/form_field_model.dart';
import '../text/money/palm_money_model.dart';
import '../text/password/password_model.dart';

class PalmTableModel implements IFormFieldModel {
  @override
  final String id;
  @override
  final String initialValue;

  @override
  final bool isEditable;

  @override
  final String name;

  @override
  final String value;

  final Set<IFormFieldModel> fields;

  @override
  final String? Function(String?) validator;

  @override
  String get key => '$runtimeType-$id-$name';

  PalmTableModel({
    required this.id,
    required this.initialValue,
    required this.isEditable,
    required this.name,
    required this.value,
    required this.fields,
    required this.validator,
  });

  factory PalmTableModel.fromMap(Map<String, dynamic> map) {
    return PalmTableModel(
      initialValue: '',
      isEditable: false,
      name: '',
      value: '',
      validator: (_) => null,
      id: Random().nextInt(5000).toString(),
      fields: {
        PalmMoneyModel(
          initialValue: '',
          isEditable: false,
          name: '',
          value: '',
          validator: (_) => 'xD',
          id: Random().nextInt(5000).toString(),
        ),
        PalmPasswordModel(
          initialValue: '',
          isEditable: false,
          name: '',
          value: '',
          validator: (_) => 'TESTE',
          id: Random().nextInt(5000).toString(),
        ),
        PalmTableModel(
          initialValue: '',
          isEditable: false,
          name: '',
          value: '',
          validator: (_) => null,
          id: Random().nextInt(5000).toString(),
          fields: {
            PalmMoneyModel(
              initialValue: '',
              isEditable: false,
              name: '',
              value: '',
              validator: (_) => 'xD',
              id: Random().nextInt(5000).toString(),
            ),
            PalmPasswordModel(
              initialValue: '',
              isEditable: false,
              name: '',
              value: '',
              validator: (_) => 'TESTE',
              id: Random().nextInt(5000).toString(),
            )
          },
        )
      },
    );
  }

  @override
  PalmTableModel copyWith({String? value, Set<IFormFieldModel>? fields}) {
    return PalmTableModel(
      initialValue: initialValue,
      isEditable: isEditable,
      name: name,
      fields: fields ?? this.fields,
      value: value ?? this.value,
      validator: validator,
      id: id,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    throw UnimplementedError();
  }

  @override
  IFormFieldModel? findModelByKey(String keyValue) {
    final filteredFields = fields.where((element) {
      return element.findModelByKey(keyValue) != null;
    });

    if (filteredFields.isEmpty) return null;

    final field = filteredFields.first;
    return field;
  }

  @override
  IFormFieldModel replaceModel(IFormFieldModel model) {
    final newFields = fields.map((e) => e.replaceModel(model)).toSet();

    return copyWith(fields: newFields);
  }
}


// TODO(danifbn): O campo de tabela/campos com subfields, não devem ter value
