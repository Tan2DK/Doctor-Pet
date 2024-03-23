import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String?>? onSaved;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final int? maxLength;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final VoidCallback? onTap;
  final bool readOnly;
  final ValueChanged<String>? onChanged; // Add this line

  const CustomTextFieldWidget({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.onSaved,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.maxLength,
    this.textInputAction = TextInputAction.next,
    this.focusNode,
    this.onFieldSubmitted,
    this.onTap,
    this.readOnly = false,
    this.onChanged, // Add this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged, // Add this line
      keyboardType: keyboardType,
      maxLength: maxLength,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      readOnly: readOnly,
    );
  }
}
