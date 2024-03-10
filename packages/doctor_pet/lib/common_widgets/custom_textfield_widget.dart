import 'package:flutter/material.dart';

class CustomTextfieldWidget extends StatefulWidget {
  const CustomTextfieldWidget({
    Key? key,
    this.isPassword = false,
    this.lable,
    this.hint,
    this.errorMessage,
    this.maxLength,
    this.onChanged,
    this.onSubmit,
  }) : super(key: key);

  final bool isPassword;
  final String? lable;
  final String? hint;
  final String? errorMessage;
  final int? maxLength;
  final Function(String? value)? onChanged;
  final Function(String? value)? onSubmit;

  @override
  State<CustomTextfieldWidget> createState() => _CustomTextfieldWidgetState();
}

class _CustomTextfieldWidgetState extends State<CustomTextfieldWidget> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword ? isShow : false,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmit,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: widget.lable,
        errorText: widget.errorMessage,
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () => setState(() {
                  isShow = !isShow;
                }),
                child: Icon(
                  isShow ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.9),
          ),
        ),
      ),
    );
  }
}
