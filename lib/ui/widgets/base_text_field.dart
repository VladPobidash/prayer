import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType inputType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool enabled;
  final Color fillColor;
  final int? maxLength;
  final Function onChange;

  const BaseTextField({
    super.key,
    required this.hintText,
    this.controller,
    required this.inputType,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.enabled = true,
    this.fillColor = Colors.white,
    this.maxLength,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      onChanged: (value) {
        onChange(value);
      },
      validator: (val) => val!.isEmpty ? 'required' : null,
      keyboardType: inputType,
      obscureText: obscureText,
      maxLength: maxLength,
      maxLines: inputType == TextInputType.multiline ? 3 : 1,
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(
        counterText: "",
        fillColor: fillColor,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: theme.textTheme.labelMedium?.copyWith(
          color: theme.hintColor.withOpacity(0.4),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorStyle: theme.textTheme.bodyMedium
            ?.copyWith(color: theme.colorScheme.error),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(width: 1, color: theme.primaryColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(width: 0, color: fillColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(width: 0, color: theme.disabledColor),
        ),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide:
              BorderSide(width: 0, color: theme.hintColor.withOpacity(0.1)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(width: 1, color: theme.colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide:
              BorderSide(width: 1, color: theme.hintColor.withOpacity(0.1)),
        ),
        focusColor: Colors.white,
        hoverColor: Colors.white,
      ),
      cursorColor: theme.primaryColor,
      style: theme.textTheme.bodyMedium,
    );
  }
}
