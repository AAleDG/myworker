import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final String? errorText;
  final void Function(String)? onChange;
  final bool? obscureText;
  final VoidCallback? onPressed;
  const AppTextField({
    super.key,
    required this.controller,
    this.hintText = '',
    this.validator,
    this.errorText,
    this.onChange,
    this.obscureText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      validator: validator,
      onChanged: onChange,
      decoration: InputDecoration(
        suffixIcon: obscureText != null
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(
                  obscureText! ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        errorText: errorText,
        errorStyle: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
