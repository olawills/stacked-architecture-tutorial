import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sign_in_with_stacked/ui/common/app_colors.dart';
import 'package:sign_in_with_stacked/ui/common/border_radius.dart';
import 'package:sign_in_with_stacked/ui/common/text_styles.dart';
import 'package:sign_in_with_stacked/ui/common/ui_helpers.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final String? validationMessage;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final bool? suffixIcon;
  final bool isDisabled;
  final bool autoFocus;
  final bool hasValidationMessage;
  final bool error;
  final String type;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.validationMessage,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.isDisabled = false,
    this.autoFocus = false,
    this.hasValidationMessage = false,
    this.type = "text",
    this.error = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.labelText, style: kLabelMedium),
          verticalSpaceSmall,
          TextFormField(
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            controller: widget.controller,
            autofocus: widget.autoFocus,
            readOnly: widget.isDisabled,
            obscureText:
                widget.suffixIcon == true ? !passwordVisibility : false,
            keyboardType: widget.type == 'text'
                ? TextInputType.text
                : TextInputType.number,
            inputFormatters: widget.type == 'text'
                ? null
                : [
                    LengthLimitingTextInputFormatter(6),
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
            style: kBodyMedium,
            decoration: InputDecoration(
              // errorText: widget.error ? widget.validationMessage : null,
              filled: widget.isDisabled == false ? null : true,
              fillColor: Colors.white,
              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      color: neutralColor,
                    )
                  : null,
              suffix: widget.suffixIcon == true
                  ? InkWell(
                      onTap: () => setState(
                        () => passwordVisibility = !passwordVisibility,
                      ),
                      child: Container(
                        transform: Matrix4.translationValues(0.0, 2.0, 0.0),
                        child: Icon(
                          passwordVisibility
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: neutralColor,
                          size: 18,
                        ),
                      ),
                    )
                  : null,
              hintText: widget.hintText,
              hintStyle: kBodyMedium.copyWith(
                color: neutralColor,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 14.0),
              border: widget.error
                  ? OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: kErrorColor, width: 1.0),
                      borderRadius: normalBorderRadius)
                  : OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: neutralColor, width: 1.0),
                      borderRadius: normalBorderRadius),
              focusedBorder: widget.error
                  ? OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: kErrorColor, width: 1.0),
                      borderRadius: normalBorderRadius)
                  : OutlineInputBorder(
                      borderSide: BorderSide(
                          color: widget.isDisabled == true
                              ? Colors.white
                              : textFieldColor,
                          width: 1.0),
                      borderRadius: normalBorderRadius),
              errorBorder: widget.error
                  ? OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: kErrorColor, width: 1.0),
                      borderRadius: normalBorderRadius)
                  : OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: kErrorColor, width: 1.0),
                      borderRadius: normalBorderRadius),
              enabledBorder: widget.error
                  ? OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: kErrorColor, width: 1.0),
                      borderRadius: normalBorderRadius)
                  : OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: neutralColor, width: 1.0),
                      borderRadius: normalBorderRadius),
            ),
          ),
          Text(
            widget.validationMessage ?? '',
            style: kValidationTextStyle.copyWith(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
