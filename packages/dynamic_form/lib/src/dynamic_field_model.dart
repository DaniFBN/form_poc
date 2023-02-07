import 'package:dynamic_form/src/interfaces/i_form_field_model.dart';
import 'package:dynamic_form/src/interfaces/i_form_field_widget.dart';

typedef FormWidgetBuilder = IFormFieldWidget Function(IFormFieldModel);

class DynamicFieldModel {
  final FormWidgetBuilder widgetBuilderByModel;

  const DynamicFieldModel({
    required this.widgetBuilderByModel,
  });
}
