import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interstellar_labs/ui/shared/colors.dart';
import 'package:interstellar_labs/ui/shared/dumb_widgets/const_widgets.dart';
import 'package:interstellar_labs/utils/export_utils.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      onModelReady: (model) {
        model.setup();
      },
      builder: (context, model, child) {
        return Container(
          height: 1.sh,
          width: 1.sw,
          decoration: const BoxDecoration(
            color: Colors.blue,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ThemeColors.splashOneColor,
                ThemeColors.splashTwoColor,
              ],
            ),
          ),
          child: Center(
            child: ReusableSvgImage(
              size: 184,
              svgIcon: SvgAssets.starFireImage,
            ),
          ),
        );
      },
      viewModelBuilder: () => StartUpViewModel(),
    );
  }
}
