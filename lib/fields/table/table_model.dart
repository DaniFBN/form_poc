import 'dart:math';

import 'package:dynamic_form/dynamic_form.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_poc/fields/table/table_widget.dart';

import '../text/money/money_model.dart';
import '../text/password/password_model.dart';

class TableModel implements IFormFieldModel {
  @override
  final String id;

  @override
  String get key => '$runtimeType-$id';

  @override
  final bool hasTrigger;


  @override
  // TODO(danifbn): Isso ta errado, teria que mexer na herança, porque isso não deveria ser um FormField
  String get value => throw UnimplementedError();

  final Set<IFormFieldModel> fields;

  TableModel({
    required this.id,
    required this.fields,
    required this.hasTrigger,
  });

  factory TableModel.fromMap(Map<String, dynamic> map) {
    return TableModel(
      hasTrigger: false,
      id: Random().nextInt(5000).toString(),
      fields: {
        MoneyModel(
          value: '',
          hasTrigger: false,
          id: Random().nextInt(5000).toString(),
        ),
        PasswordModel(
          value: '',
          hasTrigger: true,
          id: Random().nextInt(5000).toString(),
        ),
        PasswordModel(
          value: '',
          hasTrigger: true,
          id: Random().nextInt(5000).toString(),
        ),
        PasswordModel(
          value: '',
          hasTrigger: true,
          id: Random().nextInt(5000).toString(),
        ),
        PasswordModel(
          value: '',
          hasTrigger: true,
          id: Random().nextInt(5000).toString(),
        ),
        PasswordModel(
          value: '',
          hasTrigger: true,
          id: Random().nextInt(5000).toString(),
        ),
        PasswordModel(
          value: '',
          hasTrigger: true,
          id: Random().nextInt(5000).toString(),
        ),
        TableModel(
          hasTrigger: false,
          id: Random().nextInt(5000).toString(),
          fields: {
            MoneyModel(
              hasTrigger: true,
              value: '',
              id: Random().nextInt(5000).toString(),
            ),
            PasswordModel(
              hasTrigger: true,
              value: '',
              id: Random().nextInt(5000).toString(),
            ),
            TableModel(
              hasTrigger: false,
              id: Random().nextInt(5000).toString(),
              fields: {
                MoneyModel(
                  hasTrigger: true,
                  value: '',
                  id: Random().nextInt(5000).toString(),
                ),
                PasswordModel(
                  hasTrigger: true,
                  value: '',
                  id: Random().nextInt(5000).toString(),
                ),
                TableModel(
                  hasTrigger: false,
                  id: Random().nextInt(5000).toString(),
                  fields: {
                    MoneyModel(
                      hasTrigger: true,
                      value: '',
                      id: Random().nextInt(5000).toString(),
                    ),
                    PasswordModel(
                      hasTrigger: true,
                      value: '',
                      id: Random().nextInt(5000).toString(),
                    ),
                    TableModel(
                      hasTrigger: false,
                      id: Random().nextInt(5000).toString(),
                      fields: {
                        MoneyModel(
                          hasTrigger: true,
                          value: '',
                          id: Random().nextInt(5000).toString(),
                        ),
                        PasswordModel(
                          hasTrigger: true,
                          value: '',
                          id: Random().nextInt(5000).toString(),
                        )
                      },
                    )
                  },
                )
              },
            )
          },
        )
      },
    );
  }

  @override
  TableModel copyWith({String? value, Set<IFormFieldModel>? fields}) {
    return TableModel(
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
  IFormFieldModel replaceModel(IFormFieldModel model) {
    final newFields = fields.map((e) => e.replaceModel(model)).toSet();

    return copyWith(fields: newFields);
  }

  @override
  bool operator ==(covariant TableModel other) {
    if (identical(this, other)) return true;

    return other.id == id && setEquals(other.fields, fields);
  }

  @override
  int get hashCode => id.hashCode ^ fields.hashCode;

  @override
  TableStyle get theme => TableStyle(Colors.amber.shade200, 5);
  
}


// TODO(danifbn): O campo de tabela/campos com subfields, não devem ter value
