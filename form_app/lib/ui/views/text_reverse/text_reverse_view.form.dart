// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:form_app/ui/views/text_reverse/text_reverse_viewmodel.dart';
import 'package:stacked/stacked.dart';

const String ReverseInputValueKey = 'reverseInput';

final Map<String, TextEditingController>
    _TextReverseViewTextEditingControllers = {};

final Map<String, FocusNode> _TextReverseViewFocusNodes = {};

final Map<String, String? Function(String?)?> _TextReverseViewTextValidations =
    {
  ReverseInputValueKey: TextReverseValidators.validateReverseText,
};

mixin $TextReverseView {
  TextEditingController get reverseInputController =>
      _getFormTextEditingController(ReverseInputValueKey);
  FocusNode get reverseInputFocusNode =>
      _getFormFocusNode(ReverseInputValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_TextReverseViewTextEditingControllers.containsKey(key)) {
      return _TextReverseViewTextEditingControllers[key]!;
    }

    _TextReverseViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _TextReverseViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_TextReverseViewFocusNodes.containsKey(key)) {
      return _TextReverseViewFocusNodes[key]!;
    }
    _TextReverseViewFocusNodes[key] = FocusNode();
    return _TextReverseViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    reverseInputController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    reverseInputController.addListener(() => _updateFormData(model));
  }

  static const bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          ReverseInputValueKey: reverseInputController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _TextReverseViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _TextReverseViewFocusNodes.values) {
      focusNode.dispose();
    }

    _TextReverseViewTextEditingControllers.clear();
    _TextReverseViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get reverseInputValue =>
      this.formValueMap[ReverseInputValueKey] as String?;

  set reverseInputValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          ReverseInputValueKey: value,
        }),
    );

    if (_TextReverseViewTextEditingControllers.containsKey(
        ReverseInputValueKey)) {
      _TextReverseViewTextEditingControllers[ReverseInputValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasReverseInput =>
      this.formValueMap.containsKey(ReverseInputValueKey) &&
      (reverseInputValue?.isNotEmpty ?? false);

  bool get hasReverseInputValidationMessage =>
      this.fieldsValidationMessages[ReverseInputValueKey]?.isNotEmpty ?? false;

  String? get reverseInputValidationMessage =>
      this.fieldsValidationMessages[ReverseInputValueKey];
}

extension Methods on FormViewModel {
  setReverseInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ReverseInputValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    reverseInputValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      ReverseInputValueKey: getValidationMessage(ReverseInputValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _TextReverseViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _TextReverseViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      ReverseInputValueKey: getValidationMessage(ReverseInputValueKey),
    });
