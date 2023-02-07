abstract class IFormFieldModel {
  String get id;
  String get key;

  IFormFieldModel? findModelByKey(String keyValue);
  IFormFieldModel replaceModel(IFormFieldModel model);
  IFormFieldModel copyWith({String? value});
}
