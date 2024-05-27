import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      required this.prefixIcon,
      required this.txt,
      this.obscure = false,
      this.suffixIcon,
      this.controllr,
      this.validation});
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final String txt;
  final bool? obscure;
  final TextEditingController? controllr;
  final String? Function(String?)? validation;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure!,
      validator: validation,
      controller: controllr,
      decoration: InputDecoration(
        hintText: txt,
        prefixIcon: prefixIcon,helperText: '',
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(vertical: 28),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(18)),
        filled: true,
        fillColor: Colors.grey,
      ),
    );
  }
}
