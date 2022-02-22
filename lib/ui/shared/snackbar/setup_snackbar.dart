import 'package:flutter/material.dart';
import 'package:interstellar_labs/app/app.locator.dart';
import 'package:interstellar_labs/ui/shared/colors.dart';
import 'package:interstellar_labs/utils/export_utils.dart';

import 'package:stacked_services/stacked_services.dart';

Future<void> setupSnackBarUI() async {
  await locator.allReady();
  final service = locator<SnackbarService>();

  // Registers a config to be used when calling showSnackbar
  service.registerCustomSnackbarConfig(
    variant: SnackBarType.success,
    config: SnackbarConfig(
      backgroundColor: BrandColors.greenColor,
      overlayColor: BrandColors.greenColor,
      textColor: Colors.white,
      snackPosition: SnackPosition.TOP,
      animationDuration: const Duration(milliseconds: 500),
      icon: const Icon(
        Icons.info,
        color: Colors.white,
        size: 20,
      ),
      snackStyle: SnackStyle.GROUNDED,
      borderRadius: 48,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackBarType.error,
    config: SnackbarConfig(
      backgroundColor: Colors.red,
      textColor: Colors.white,
      snackPosition: SnackPosition.TOP,
      overlayColor: Colors.red,
      snackStyle: SnackStyle.GROUNDED,
      borderRadius: 16.0,
      animationDuration: const Duration(milliseconds: 900),
      icon: const Icon(
        Icons.info,
        color: Colors.white,
        size: 20,
      ),
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackBarType.info,
    config: SnackbarConfig(
      backgroundColor: Colors.black,
      textColor: Colors.white,
      snackPosition: SnackPosition.TOP,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      overlayColor: Colors.black,
      borderRadius: 16,
      animationDuration: const Duration(milliseconds: 500),
      icon: const Icon(
        Icons.info,
        color: Colors.white,
        size: 20,
      ),
    ),
  );
}
