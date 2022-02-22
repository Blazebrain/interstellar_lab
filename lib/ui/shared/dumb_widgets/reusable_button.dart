import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';
import '../text_styles.dart';

class ReusableButton extends StatelessWidget {
  final void Function() onPressed;
  final String? label;
  final Color? labelColor;
  final TextStyle? labelTextStyle;
  final Color? backgroundColor;
  final Color? splashColor;
  final Color? highlightColor;
  final double? height;
  final double? width;
  final double? elevation;
  final EdgeInsets? padding;
  final FontWeight? labelWeight;
  final Widget? customChild;
  final double borderRadius;
  final BorderSide? borderSide;

  const ReusableButton({
    Key? key,
    this.labelColor,
    required this.onPressed,
    this.label,
    this.backgroundColor,
    this.height,
    this.width,
    this.elevation,
    this.labelWeight,
    this.borderRadius = 100,
    this.labelTextStyle,
    this.borderSide,
    this.customChild,
    this.padding,
    this.splashColor,
    this.highlightColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: elevation ?? 0,
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      splashColor: splashColor,
      highlightColor: highlightColor,
      fillColor: backgroundColor ?? BrandColors.greenColor,
      constraints: BoxConstraints.tightFor(
        height: height ?? 44.h,
        width: width ?? double.infinity,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            borderRadius.r,
          ),
        ),
        side: borderSide ?? BorderSide.none,
      ),
      padding: padding ??
          EdgeInsets.symmetric(
            vertical: 8.h,
            horizontal: 16.w,
          ),
      child: customChild ??
          FittedBox(
            child: Text(
              label!,
              style: labelTextStyle ??
                  AppTextStyles.buttonTextStyle.copyWith(color: labelColor),
            ),
          ),
    );
  }
}
