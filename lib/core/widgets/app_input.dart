import 'package:avon/core/widgets/app_image.dart';
import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final String? suffixIcon, hint;

  const AppInput({super.key, this.suffixIcon, this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        isDense: true,
        suffixIcon: suffixIcon != null
            ? AppImage(suffixIcon!, width: 18, height: 18)
            : null,
      ),
    );
  }
}
