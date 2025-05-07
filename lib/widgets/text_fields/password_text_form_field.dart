import 'package:flutter/material.dart';

import 'text_form_field.dart';

class PasswordTextFormField extends StatelessWidget {
  final bool? enabled;
  final String? initialValue;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final Key? fieldKey;

  const PasswordTextFormField({
    this.enabled,
    this.initialValue,
    this.hintText,
    this.helperText,
    this.errorText,
    this.controller,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction,
    this.fieldKey,
  });

  @override
  Widget build(final BuildContext context) {
    return AppTextFormField(
      fieldKey: fieldKey,
      enabled: enabled,
      initialValue: initialValue,
      hintText: hintText,
      helperText: helperText,
      errorText: errorText,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction,
      autofillHints: const [
        AutofillHints.password,
      ],
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
    );
  }
}
