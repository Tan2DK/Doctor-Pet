import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    this.textInputFormatter,
  }) : super(key: key);

  final bool isPassword;
  final String? lable;
  final String? hint;
  final String? errorMessage;
  final int? maxLength;
  final Function(String? value)? onChanged;
  final Function(String? value)? onSubmit;
  final List<TextInputFormatter>? textInputFormatter;

  @override
  State<CustomTextfieldWidget> createState() => _CustomTextfieldWidgetState();
}

class _CustomTextfieldWidgetState extends State<CustomTextfieldWidget> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: widget.textInputFormatter,
      obscureText: widget.isPassword ? !isShow : false,
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
                  isShow ? Icons.visibility : Icons.visibility_off,
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
