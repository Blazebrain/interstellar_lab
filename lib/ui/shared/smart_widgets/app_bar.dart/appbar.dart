// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:raptures/ui/export_shared_widgets.dart';
// import 'package:raptures/utils/export_utils.dart';

// class MainHeaderAppBar extends AppBar {
//   final void Function()? onTapProfile;
//   final void Function()? onTapSearch;
//   final void Function()? onTapSettings;
//   final void Function()? onTapHome;
//   final bool showSettings;
//   final Widget? customTitle;
//   final Color? backgroundColorValue;

//   MainHeaderAppBar({
//     Key? key,
//     this.onTapProfile,
//     this.onTapSearch,
//     this.showSettings = false,
//     this.onTapSettings,
//     this.onTapHome,
//     this.customTitle,
//     this.backgroundColorValue,
//   }) : super(
//           key: key,
//           automaticallyImplyLeading: false,
//           leading: GestureDetector(
//             onTap: onTapHome,
//             child: Row(
//               children: [
//                 horizontalSpaceRegular,
//                 Image.asset(
//                   ImageAssets.raptureMonitorHead,
//                   height: 42.h,
//                 ),
//               ],
//             ),
//           ),
//           title: customTitle,
//           backgroundColor: backgroundColorValue ?? BrandColors.whiteColor,
//           elevation: 0.5,
//           actions: [
//             Row(
//               children: [
//                 GestureDetector(
//                   onTap: onTapSearch,
//                   child: ReusableSvgImage(
//                     svgIcon: SvgAssets.searchIcon,
//                     color: ThemeColors.graySevenColor,
//                     size: 16.0.w,
//                   ),
//                 ),
//                 horizontalSpaceMedium,
//                 if (showSettings) ...[
//                   GestureDetector(
//                     onTap: onTapSettings,
//                     child: Icon(
//                       Icons.settings,
//                       size: 22.0.w,
//                       color: ThemeColors.graySevenColor,
//                     ),
//                   ),
//                   horizontalSpaceMedium,
//                 ],
//                 GestureDetector(
//                   onTap: onTapProfile,
//                   child: ReusableSvgImage(
//                     svgIcon: SvgAssets.profileIcon,
//                     color: ThemeColors.graySevenColor,
//                     size: 18.0.w,
//                   ),
//                 ),
//                 horizontalSpaceRegular,
//               ],
//             ),
//           ],
//         );
// }
