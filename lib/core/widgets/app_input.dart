import 'package:avon/core/widgets/app_country_code.dart';
import 'package:avon/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInput extends StatefulWidget {
  final TextEditingController? controller;
  final String? suffixIcon, hint, label;
  final bool withCountryCode, isPassword;
  final double? bottomSpace;
  final ValueChanged<String>? onCountryCodeChanged;
  final String? Function(String?)? validator;

  const AppInput({
    super.key,
    this.suffixIcon,
    this.hint,
    this.label,
    this.withCountryCode = false,
    this.isPassword = false,
    this.bottomSpace,
    this.controller,
    this.onCountryCodeChanged,
    this.validator,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomSpace ?? 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.withCountryCode)
            AppCountryCode(onCountryCodeChanged: widget.onCountryCodeChanged),
          if (widget.withCountryCode) SizedBox(width: 6.w),
          Expanded(
            child: TextFormField(
              validator: widget.validator,
              controller: widget.controller,
              obscureText: widget.isPassword && isHidden,
              decoration: InputDecoration(
                hintText: widget.hint,
                labelText: widget.label,
                isDense: true,
                suffixIcon: widget.isPassword
                    ? IconButton(
                        onPressed: () {
                          isHidden = !isHidden;
                          setState(() {});
                        },
                        icon: AppImage(
                          isHidden ? "visibility.svg" : "visibility_off.svg",
                        ),
                      )
                    : widget.suffixIcon != null
                    ? AppImage(widget.suffixIcon!, width: 18.w, height: 18.h)
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
