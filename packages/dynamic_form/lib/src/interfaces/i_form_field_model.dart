abstract class IFormFieldModel<T> {
  String get id;
  String get key;
  bool get hasTrigger;

  IFormFieldModel? findModelByKey(String keyValue);
  IFormFieldModel replaceModel(IFormFieldModel model);
  IFormFieldModel copyWith({String? value});
}
