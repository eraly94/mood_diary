import 'package:flutter/material.dart';
import 'package:mood_diary/core/theme/app_colors.dart';
import 'package:mood_diary/core/theme/app_styles.dart';

class GlTextFormField extends StatefulWidget {
  const GlTextFormField({
    super.key,
    this.hintText,
    this.controller,
    required this.obscureText,
  });

  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  @override
  State<GlTextFormField> createState() => _GlTextFormFieldState();
}

class _GlTextFormFieldState extends State<GlTextFormField> {
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    final icon = widget.obscureText
        ? IconButton(
            splashRadius: 13,
            icon: Icon(
              _passwordVisible
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
            onPressed: () {
              _passwordVisible = !_passwordVisible;
              setState(() {});
            },
            color: AppColors.grey,
          )
        : null;
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.hintText;
        }
        return null;
      },
      controller: widget.controller,
      obscureText: widget.obscureText && !_passwordVisible,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        suffixIcon: icon,
        fillColor: AppColors.grey4,
        filled: true,
        hintText: widget.hintText,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.tangerine),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintStyle: AppStyles.w400f14.copyWith(
          color: AppColors.grey4,
        ),
      ),
    );
  }
}
