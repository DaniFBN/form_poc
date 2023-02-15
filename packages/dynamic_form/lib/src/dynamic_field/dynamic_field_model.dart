import 'package:dynamic_form/src/form_field/i_form_field_model.dart';
import 'package:dynamic_form/src/form_field/form_field_widget.dart';

typedef FormWidgetBuilder = FormFieldWidget Function(IFormFieldModel model);
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
