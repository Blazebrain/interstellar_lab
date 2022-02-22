import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:interstellar_labs/utils/export_utils.dart';

/// Reusable circular loading indicator
class ReusableDotProgressIndicator extends StatelessWidget {
  final Color? color;
  final double? size;

  const ReusableDotProgressIndicator({Key? key, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: color ?? Colors.white,
      size: size ?? 20,
    );
  }
}

/// Use SvgAsset.iconName to specify the svg icon
class ReusableSvgImage extends StatelessWidget {
  final SvgData svgIcon;
  final Color? color;
  final double? size;

  const ReusableSvgImage({
    Key? key,
    required this.svgIcon,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgIcon.data,
      color: color,
      height: size,
    );
  }
}
