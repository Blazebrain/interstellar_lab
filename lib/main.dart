import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interstellar_labs/app/app.locator.dart';
import 'package:interstellar_labs/app/app.router.dart';
import 'package:interstellar_labs/ui/shared/snackbar/setup_snackbar.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await setupSnackBarUI();
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode && kDebugMode && !kProfileMode,
    // builder: (context) =>
    const MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: () {
        return MaterialApp(
          title: 'Interstellar Labs',
          navigatorKey: StackedService.navigatorKey,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.startUpView,
        );
      },
    );
  }
}
