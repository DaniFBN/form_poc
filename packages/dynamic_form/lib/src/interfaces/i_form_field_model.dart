abstract class IFormFieldModel<T> {
  String get id;
  String get key;
  bool get hasTrigger;

  Map<String, dynamic> toMap();
  IFormFieldModel replaceModel(IFormFieldModel model);
  IFormFieldModel copyWith({String? value});
}
