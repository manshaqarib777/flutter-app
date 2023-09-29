import 'dart:collection';

import 'package:gs_app/utils/widget_types.dart';

import '../interfaces/widget_operations.dart';
import '../src/shared/input_text.dart';
import '../src/shared/custom_text_field.dart';
import '../src/shared/parent_widget.dart';

class WidgetInteractions {
  static Map<String, WidgetOperations> map = LinkedHashMap();

  WidgetInteractions._privateConstructor() {
    _registerWidgets();
  }

  static WidgetInteractions instance = WidgetInteractions._privateConstructor();

  _registerWidgets() {
    map[WidgetTypes.CUSTOM_EDIT_TEXT] = CustomTextField();
    map[WidgetTypes.CUSTOM_INPUT_TEXT] = InputText();
  }

  bool validateWidget(ParentWidget field, String type) {
    return map[type]!.validate(field);
  }
}
