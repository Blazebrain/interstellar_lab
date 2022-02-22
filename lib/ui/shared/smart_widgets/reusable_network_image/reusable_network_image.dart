import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interstellar_labs/ui/shared/colors.dart';
import 'package:interstellar_labs/ui/shared/dumb_widgets/const_widgets.dart';
import 'package:interstellar_labs/ui/shared/smart_widgets/reusable_network_image/reusable_network_image_viewmodel.dart';
import 'package:interstellar_labs/utils/constants/app_assets.dart';

import 'package:stacked/stacked.dart';

class ReusableNetworkImage extends HookWidget {
  final String url;
  final double? opacity;
  final Color? color;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final BoxShape? boxShape;
  final bool cache;
  final bool isZoomable;
  final bool useSpecialIndicatorForComic;
  final bool useDotLoadingIndicator;
  final bool hasAnyLoadingIndicator;
  final BorderRadius? borderRadius;

  const ReusableNetworkImage({
    Key? key,
    required this.url,
    this.opacity,
    this.color,
    this.fit,
    this.borderRadius,
    this.boxShape,
    this.height,
    this.width,
    this.cache = true,
    this.isZoomable = false,
    this.useSpecialIndicatorForComic = false,
    this.useDotLoadingIndicator = false,
    this.hasAnyLoadingIndicator = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnimationController _animationController = useAnimationController(
      duration: const Duration(milliseconds: 0),
    );
    Function() animationListener = () {};
    Animation? _animation;
    return ViewModelBuilder<ReusableNetworkImageViewModel>.reactive(
      onModelReady: (model) {
        if (useSpecialIndicatorForComic) {
          model.loading(true);
        }
      },
      builder: (context, model, child) {
        return ExtendedImage.network(
          url,
          fit: fit ?? BoxFit.cover,
          shape: boxShape ?? BoxShape.rectangle,
          height: height,
          width: width,
          mode: isZoomable ? ExtendedImageMode.gesture : ExtendedImageMode.none,
          initGestureConfigHandler: isZoomable
              ? (state) {
                  return GestureConfig(
                    minScale: 0.9,
                    animationMinScale: 0.7,
                    maxScale: 5.0,
                    animationMaxScale: 5.5,
                    speed: 1,
                    inertialSpeed: 100.0,
                    initialScale: 1.0,
                    inPageView: false,
                    initialAlignment: InitialAlignment.center,
                  );
                }
              : null,
          onDoubleTap: isZoomable
              ? (ExtendedImageGestureState state) {
                  var pointerDownPosition = state.pointerDownPosition;
                  double begin = state.gestureDetails!.totalScale!;
                  double end;

                  _animation?.removeListener(animationListener);
                  _animationController.stop();
                  _animationController.reset();

                  if (begin == 1) {
                    end = 1.5;
                  } else {
                    end = 1;
                  }
                  animationListener = () {
                    state.handleDoubleTap(
                        scale: _animation!.value,
                        doubleTapPosition: pointerDownPosition);
                  };
                  _animation = _animationController
                      .drive(Tween<double>(begin: begin, end: end));

                  _animation!.addListener(animationListener);

                  _animationController.forward();
                }
              : null,
          borderRadius: borderRadius ??
              BorderRadius.all(
                Radius.circular(4.0.r),
              ),
          color: color,
          opacity: AlwaysStoppedAnimation<double>(opacity ?? 1),
          cache: cache,
          loadStateChanged: (ExtendedImageState state) {
            switch (state.extendedImageLoadState) {
              case LoadState.loading:
                if (useDotLoadingIndicator) {
                  return Container(
                    height: 0.85.sh,
                    color: BrandColors.whiteColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        ReusableDotProgressIndicator(
                          color: BrandColors.mudRedColor,
                        ),
                      ],
                    ),
                  );
                }
                if (hasAnyLoadingIndicator) {
                  return const ReusableDotProgressIndicator(
                    color: ThemeColors.grayColor,
                    size: 14,
                  );
                } else {
                  return const SizedBox();
                }
              case LoadState.completed:
                model.loading(false);
                return state.completedWidget;
              case LoadState.failed:
                return Opacity(
                  opacity: 0.3,
                  child: ReusableSvgImage(
                    svgIcon: SvgAssets.starFireImage,
                    size: 56,
                  ),
                );
            }
          },
        );
      },
      viewModelBuilder: () => ReusableNetworkImageViewModel(),
    );
  }
}
