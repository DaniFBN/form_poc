// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'fields/table/table_model.dart';
import 'fields/table/table_widget.dart';
import 'fields/text/money/palm_money_field.dart';
import 'fields/text/money/palm_money_model.dart';
import 'fields/text/password/palm_password_field.dart';
import 'fields/text/password/password_model.dart';
import 'interfaces/form_field_model.dart';
import 'interfaces/form_field_widget.dart';

typedef MapFieldBuilder = IFormFieldWidget Function(Map<String, dynamic> map);
typedef ModelMapBuilder = IFormFieldModel Function(Map<String, dynamic> map);
typedef FieldBuilder = IFormFieldWidget Function(
    {required IFormFieldModel model});

class Resolver {
  const Resolver._();

  static final Set<Field> _fields = {
    Field(
      type: 'PalmPasswordField',
      model: 'PalmPasswordModel',
      modelFromMap: PalmPasswordModel.fromMap,
      builder: ({required IFormFieldModel model}) {
        return PalmPasswordField(model: model as PalmPasswordModel);
      },
      mapBuilder: (map) {
        return PalmPasswordField(model: PalmPasswordModel.fromMap(map));
      },
    ),
    Field(
      type: 'PalmMoneyField',
      model: 'PalmMoneyModel',
      modelFromMap: PalmMoneyModel.fromMap,
      builder: ({required IFormFieldModel model}) {
        return PalmMoneyField(model: model as PalmMoneyModel);
      },
      mapBuilder: (map) {
        return PalmMoneyField(model: PalmMoneyModel.fromMap(map));
      },
    ),
    Field(
      type: 'TableWidget',
      model: 'PalmTableModel',
      modelFromMap: PalmTableModel.fromMap,
      builder: ({required IFormFieldModel model}) {
        return TableWidget(model: model as PalmTableModel);
      },
      mapBuilder: (map) {
        return TableWidget(model: PalmTableModel.fromMap(map));
      },
    ),
  };

  static Set<Field> get fields => _fields;

  static void addField(Field field) {
    _fields.add(field);
  }

  static MapFieldBuilder getBuilderByType(String type) {
    final fields = _fields.where((e) => e.type == type);

    if (fields.isEmpty) {
      throw 'Not found $type';
    }

    final field = fields.first;

    return field.mapBuilder;
  }

  static MapFieldBuilder getBuilderByModel(String model) {
    final fields = _fields.where((e) => e.model == model);

    if (fields.isEmpty) {
      throw 'Not found $model';
    }

    final field = fields.first;

    return field.mapBuilder;
  }

  static Field getFieldByModel(String model) {
    final fields = _fields.where((e) => e.model == model);

    if (fields.isEmpty) {
      throw 'Not found $model';
    }

    final field = fields.first;

    return field;
  }
}

class Field {
  final String type;
  final String model;
  final MapFieldBuilder mapBuilder;
  final FieldBuilder builder;
  final ModelMapBuilder modelFromMap;

  const Field({
    required this.type,
    required this.model,
    required this.mapBuilder,
    required this.builder,
    required this.modelFromMap,
  });
}
