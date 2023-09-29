import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gs_app/config/app_string.dart';

import '../../config/app_colors.dart';
import '../../config/app_text_styles.dart';
import '../../config/translation_keys.dart';

class BaseTextField extends StatefulWidget {
  TextEditingController _tfController;
  GlobalKey<FormFieldState> _refKey;
  Function _isValidationFailed;
  Function _onChange;
  int _fieldType;
  String _label;
  String _hint;
  int _fieldStyle;
  TextInputType _keyboardType;
  List<TextInputFormatter> _inputValidators;
  bool _readOnly;
  bool _showCursor;
  VoidCallback _onTap;
  int? maxLength;
  BaseTextField(
    this._tfController,
    this._refKey,
    this._isValidationFailed,
    this._onChange,
    this._fieldType,
    this._passwordVisible,
    this._hint,
    this._label,
    this._fieldStyle,
    this._keyboardType,
    this._inputValidators,
    this._readOnly,
    this._showCursor,
    this._onTap,
    this.maxLength,
  );
  EdgeInsets _inputPadding =
      const EdgeInsets.symmetric(horizontal: 14, vertical: 18);

  Color _bgColor = AppColors.white;
  Color _borderColor = AppColors.primaryColor;
  Color _errorBgColor = AppColors.tfErrorBgColor;
  Color _errorBorderColor = AppColors.tfErrorBorderColor;
  String _error =AppStrings.thisFieldIsRequired;
  Color _enabledBorderColor = AppColors.labelColor;
  TextStyle _labelStyle = AppTextStyles.labelTextStyle;
  TextStyle _hintStyle = AppTextStyles.hintTextStyle;
  TextStyle _errorStyle = AppTextStyles.errorTextStyle;
  TextStyle _inputStyle = AppTextStyles.tfInputTextStyle;
  bool _isError = false;
  BorderRadius _borderRadius = BorderRadius.all(Radius.circular(4));
  Widget? _suffixIcon;
  final int _minLines = 1;
  int _maxLines = 1;
  bool _passwordVisible;

  Function get onChange => _onChange;

  BaseTextField setInputPadding(value) {
    _inputPadding = value;
    return this;
  }



  BaseTextField setEnabledBorderColor(Color value) {
    _enabledBorderColor = value;
    return this;
  }

  BaseTextField setMaxLines(value) {
    _maxLines = value;
    return this;
  }

  BaseTextField setSuffixIcon(value) {
    _suffixIcon = value;
    return this;
  }

  BaseTextField setError(String value) {
    _error = value;
    return this;
  }

  BaseTextField setBgColor(Color value) {
    _bgColor = value;
    return this;
  }

  BaseTextField setBorderColor(value) {
    _borderColor = value;
    return this;
  }

  BaseTextField setLabelStyle(TextStyle value) {
    _labelStyle = value;
    return this;
  }

  BaseTextField setHintStyle(TextStyle value) {
    _hintStyle = value;
    return this;
  }

  BaseTextField setErrorStyle(value) {
    _errorStyle = value;
    return this;
  }

  BaseTextField setInputStyle(value) {
    _inputStyle = value;
    return this;
  }

  BaseTextField setIsError(bool value) {
    _isError = value;
    return this;
  }

  BaseTextField setBorderRadius(BorderRadius value) {
    _borderRadius = value;
    return this;
  }

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  late Color _bgColor;
  late Color _borderColor;

  String? _validate(value) {
    if (widget._isValidationFailed(value)) {
      _bgColor = widget._errorBgColor;
      _borderColor = widget._errorBorderColor;
      widget._isError = true;
    } else {
      _setNormalState();
    }
    setState(() {});
  }

  _setNormalState() {
    _bgColor = widget._bgColor;
    _borderColor = widget._borderColor;
    widget._isError = false;
  }

  _setValidation(value) {
    if (widget._onChange(value)) {
      setState(() {
        _setNormalState();
      });
    }
  }

  _setTextFieldColors() {
    _bgColor = widget._bgColor;
    _borderColor = widget._borderColor;
  }

  @override
  void initState() {
    _setTextFieldColors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        widget._onTap();
      },
      validator: (value) {
        _validate(value);
      },
      maxLength: widget.maxLength,
      readOnly: widget._readOnly,
      showCursor: widget._showCursor,
      minLines: widget._minLines,
      maxLines: widget._maxLines,
      key: widget._refKey,
      keyboardType: widget._keyboardType,
      inputFormatters: widget._inputValidators,
      style: widget._inputStyle,
      controller: widget._tfController,
      onChanged: (value) {
        _setValidation(value);
      },
      obscureText: widget._fieldType == TextFieldType.PASSWORD
          ? widget._passwordVisible
          : false,
      decoration: InputDecoration(
          filled: true,
          fillColor: _bgColor,
          errorStyle: widget._errorStyle,
          errorText:
              widget._isError ? widget._error : null,
          contentPadding: widget._inputPadding,
          isDense: true,
          border: _getEnabledBorder(),
          focusedBorder: _getFocusedBorder(),
          enabledBorder: _getEnabledBorder(),
          errorBorder: _getErrorBorder(),
          focusedErrorBorder: _getFocusedErrorBorder(),
          labelText: widget._label.isEmpty
              ? null
              : widget._label,
          suffixIcon: widget._suffixIcon,
          suffixIconConstraints: BoxConstraints(maxHeight: 25),
          labelStyle: widget._labelStyle,
          hintText: widget._hint,
          hintStyle: widget._hintStyle),
    );
  }

  InputBorder _getFocusedBorder() {
    return getBorder(_borderColor);
  }

  InputBorder _getEnabledBorder() {
    return getBorder(widget._enabledBorderColor);
  }

  InputBorder _getErrorBorder() {
    return getBorder(_borderColor);
  }

  InputBorder _getFocusedErrorBorder() {
    return getBorder(_borderColor);
  }

  InputBorder getBorder(Color color) {
    InputBorder defBorder = UnderlineInputBorder(
      borderRadius: widget._borderRadius,
      borderSide: BorderSide(
        color: color,
      ),
    );

    if (widget._fieldStyle == TextFieldStyle.OUTLINED) {
      return OutlineInputBorder(
        borderRadius: widget._borderRadius,
        borderSide: BorderSide(
          color: color,
        ),
      );
    }
    return defBorder;
  }

  @override
  void dispose() {
    widget._tfController.dispose();
    super.dispose();
  }
}

class TextFieldStyle {
  static const int OUTLINED = 1;
  static const int UNDERLINE = 2;
}

class TextFieldType {
  static const int PASSWORD = 1;
  static const int SIMPLE_TEXTFIELD = 2;
}
