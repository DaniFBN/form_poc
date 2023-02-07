// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dynamic_form/src/interfaces/i_form_field_model.dart';
import 'package:dynamic_form/src/interfaces/i_form_field_widget.dart';

typedef FormWidgetBuilder = IFormFieldWidget Function(IFormFieldModel model);
typedef ModelFromMapBuilder = IFormFieldModel Function(
  Map<String, dynamic> map,
);

class DynamicFieldModel {
  final String name;
  final FormWidgetBuilder widgetBuilderByModel;
  final ModelFromMapBuilder modelFromMapBuilder;

  const DynamicFieldModel({
    required this.name,
    required this.widgetBuilderByModel,
    required this.modelFromMapBuilder,
  });

  @override
  bool operator ==(covariant DynamicFieldModel other) {
    if (identical(this, other)) return true;

    return other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
