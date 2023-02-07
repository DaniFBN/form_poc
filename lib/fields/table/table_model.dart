import 'dart:math';

import 'package:dynamic_form/dynamic_form.dart';

import '../text/money/palm_money_model.dart';
import '../text/password/password_model.dart';

class PalmTableModel implements IFormFieldModel {
  @override
  final String id;

  @override
  String get key => '$runtimeType-$id';

  @override
  final bool hasTrigger;

  final Set<IFormFieldModel> fields;

  PalmTableModel({
    required this.id,
    required this.fields,
    required this.hasTrigger,
  });

  factory PalmTableModel.fromMap(Map<String, dynamic> map) {
    return PalmTableModel(
      hasTrigger: false,
      id: Random().nextInt(5000).toString(),
      fields: {
        PalmMoneyModel(
          value: '',
          hasTrigger: false,
          id: Random().nextInt(5000).toString(),
        ),
        PalmPasswordModel(
          value: '',
          hasTrigger: true,
          id: Random().nextInt(5000).toString(),
        ),
        PalmTableModel(
          hasTrigger: false,
          id: Random().nextInt(5000).toString(),
          fields: {
            PalmMoneyModel(
              hasTrigger: true,
              value: '',
              id: Random().nextInt(5000).toString(),
            ),
            PalmPasswordModel(
              hasTrigger: true,
              value: '',
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
      fields: fields ?? this.fields,
      hasTrigger: hasTrigger,
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
