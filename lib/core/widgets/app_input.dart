import 'package:avon/core/widgets/app_image.dart';
import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  const AppInput({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: AppImage(
          "search.svg",
          width: 18,
          height: 18,
        ),
      ),
    );
  }
}
