import 'package:flutter/material.dart';

class CustomTextfieldWidget extends StatefulWidget {
  const CustomTextfieldWidget(
      {Key? key,
      this.lable,
      this.hint,
      this.errorMessage,
      this.maxLength,
      this.onChanged,
      this.onSubmit,
      this.icons,
      this.controller,
      this.onPressed,
      this.fixIcon,
      this.onTap})
      : super(key: key);
  final TextEditingController? controller;
  final String? lable;
  final String? hint;
  final String? errorMessage;
  final int? maxLength;
  final Widget? icons;
  final Widget? fixIcon;
  final Function()? onPressed;
  final Function(String? value)? onTap;
  final Function(String? value)? onChanged;
  final Function(String? value)? onSubmit;

  @override
  State<CustomTextfieldWidget> createState() => _CustomTextfieldWidgetState();
}

class _CustomTextfieldWidgetState extends State<CustomTextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmit,
      maxLength: widget.maxLength,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: widget.lable,
        errorText: widget.errorMessage,
        suffixIcon: widget.icons,
        prefixIcon: widget.fixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          // borderSide: BorderSide(
          //   color: Colors.black.withOpacity(0.9),
          // ),
        ),
      ),
    );
  }
}
