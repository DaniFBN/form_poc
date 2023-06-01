import 'package:dynamic_form/dynamic_form.dart';

import 'radio_model.dart';

class RadioController extends FormFieldController<RadioModel> {
  RadioController(super.value);

  @override
  void whenModelIsChanged(RadioModel newModel) {
    super.whenModelIsChanged(newModel);
  }
}
