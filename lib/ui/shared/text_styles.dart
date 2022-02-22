import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Poppins for header texts, Montserrat for body

// Without package google fonts
class AppTextStyles {
  // static const _montserrat = 'Montserrat';
  static const _sfProText = 'SF Pro Text';

  static final buttonTextStyle = TextStyle(
    fontSize: 16.sp,
    fontFamily: _sfProText,
  );
}
