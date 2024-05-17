import 'package:flutter/material.dart';

class CustomFormFiled extends StatelessWidget {
  const CustomFormFiled({super.key,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.inputType,
    this.onChanged,
    this.onSubmit,
    this.validator,
    this.onPressed,
    this.onSaved,
    this.onEditingComplete,});

  final String? label;
  final String? hint;
  final Icon? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmit;
  final String? Function(String?)? validator;
  final VoidCallback? onPressed;
  final bool obscure = false;
  final Function(String?)? onSaved;
  final Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      keyboardType: inputType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label ?? '',
        prefixIcon: prefixIcon,
        hintText: hint ?? '',
        suffixIcon: suffixIcon != null
            ? IconButton(
          onPressed: onPressed,
          icon: Icon(suffixIcon),
        )
            : null,
      ),
      onChanged: onChanged,
      validator: validator,
      onSaved: onSaved,
      onEditingComplete:onEditingComplete,
      onFieldSubmitted: onSubmit,
    );
  }
}
