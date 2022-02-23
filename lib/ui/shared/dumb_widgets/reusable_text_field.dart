import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';

/// Reusable TextField for forms
class ReusableTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final bool? obscureText;
  final bool? isDense;
  final TextInputType? keyBoardType;
  final TextEditingController? controller;
  final EdgeInsets? contentPadding;
  final String? textFieldName;
  final String? hintText;
  final String? bottomText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final bool hasBorder;
  final Color textFieldColor;
  final String? counterText;
  final void Function(String input)? onChanged;
  final String? Function(String? input)? validator;
  final bool? enabled;

  const ReusableTextField({
    Key? key,
    this.obscureText,
    this.enabled,
    this.controller,
    this.keyBoardType,
    this.prefixIcon,
    this.textFieldName,
    this.hintText,
    this.maxLines,
    this.maxLength,
    this.minLines,
    this.suffixIcon,
    this.focusNode,
    this.bottomText,
    this.hasBorder = true,
    this.textFieldColor = BrandColors.whiteColor,
    this.onChanged,
    this.counterText,
    this.validator,
    this.isDense = false,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          obscureText: obscureText == null ? false : obscureText!,
          maxLines: maxLines ?? 1,
          minLines: minLines,
          // style: AppTextStyles.kBodyMedium.copyWith(fontSize: 16.sp),
          keyboardType: keyBoardType,
          maxLength: maxLength,
          cursorWidth: 2.w,
          controller: controller,
          enabled: enabled,
          focusNode: focusNode,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: textFieldColor,
            hintText: hintText,
            // hintStyle: AppTextStyles.kBodyMedium.copyWith(
            //     color: ThemeColors.grayOneColor.withOpacity(0.5),
            //     fontSize: 14.sp),
            isDense: isDense,
            counterText: counterText ?? '',
            prefixIcon: prefixIcon,
            border: hasBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0.r),
                    ),
                    borderSide: BorderSide(
                      // color: BrandColors.purpleColor,
                      width: 1.5.w,
                    ),
                  )
                : const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
            focusedBorder: hasBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0.r),
                    ),
                    borderSide: BorderSide(
                      // color: BrandColors.purpleColor,
                      width: 1.5.w,
                    ),
                  )
                : const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
            enabledBorder: hasBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0.r),
                    ),
                    borderSide: BorderSide(
                      color: ThemeColors.grayColor,
                      width: 1.5.w,
                    ),
                  )
                : const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(horizontal: 14.0.w, vertical: 16.0.h),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
