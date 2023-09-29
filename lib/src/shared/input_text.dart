import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gs_app/src/shared/parent_widget.dart';

import '../../config/app_assets.dart';
import '../../config/app_colors.dart';
import '../../interfaces/widget_operations.dart';
import '../../utils/app_constants.dart';
import '../../utils/widget_types.dart';
import 'base_textfield.dart';

class InputText extends ParentWidget implements WidgetOperations {
  TextInputType _keyboardType = TextInputType.text;
  List<TextInputFormatter> _inputValidators = const [];

  final TextEditingController _tfController = TextEditingController();
  final GlobalKey<FormFieldState> _refKey = GlobalKey<FormFieldState>();
  int _fieldType = TextFieldType.SIMPLE_TEXTFIELD;
  bool _passwordVisible = true;
  String _label = "";

  String _hint = "";

  int _fieldStyle = TextFieldStyle.OUTLINED;

  IconData _suffixIcon = AppAssets.person;
  bool _suffixIconVisible = true;


  InputText setSuffixIcon(IconData suffixIcon) {
    _suffixIcon = suffixIcon;
    return this;
  }
  InputText setSuffixIconVisible(bool suffixIconVisible) {
    _suffixIconVisible = suffixIconVisible;
    return this;
  }
  InputText setWidgetType(int type) {
    _fieldStyle = type;
    return this;
  }

  InputText setLabel(String value) {
    _label = value;
    return this;
  }

  InputText setHint(String value) {
    _hint = value;
    return this;
  }

  InputText setTag(String key, Object value) {
    tags[key] = value;
    return this;
  }

  InputText setKeyboardType(TextInputType value) {
    _keyboardType = value;
    return this;
  }

  InputText setInputValidators(List<TextInputFormatter> value) {
    _inputValidators = value;
    return this;
  }

  InputText setPasswordVisibility(value) {
    _passwordVisible = value;
    return this;
  }

  InputText setFieldType(int value) {
    _fieldType = value;
    return this;
  }

  @override
  _ChiveInputTextState createState() => _ChiveInputTextState();

  @override
  bool validate(Widget widget) {
    InputText textField = widget as InputText;
    textField._refKey.currentState!.validate();
    return true;
  }
}

class _ChiveInputTextState extends State<InputText> {
  BaseTextField? baseTextField;

  initTextField() {
    widget.setTag(AppConstants.FIELD_TYPE, WidgetTypes.CUSTOM_INPUT_TEXT);
    baseTextField = BaseTextField(widget._tfController, widget._refKey,
        (value) {
      return value.isEmpty;
    }, (value) {
      return value.isNotEmpty;
    },
        widget._fieldType,
        widget._passwordVisible,
        widget._hint,
        widget._label,
        widget._fieldStyle,
        widget._keyboardType,
        widget._inputValidators,
        false,
        true,
        () {},
        null);
  }

  @override
  Widget build(BuildContext context) {
    initTextField();
    return baseTextField!.setSuffixIcon(
      widget._fieldType == TextFieldType.PASSWORD
          ? IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                size: 25,
                widget._passwordVisible
                    ? AppAssets.passwordHide
                    : AppAssets.passwordVisible,
                color: AppColors.labelColor,
              ),
              onPressed: () {
                setState(() {
                  widget.setPasswordVisibility(!widget._passwordVisible);
                });
              },
            )
          : widget._suffixIconVisible ? IconButton(
        padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(
                size: 25,
                widget._suffixIcon,
                color: AppColors.labelColor,
              ),
            ) : null,
    );
  }
}
