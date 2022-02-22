import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interstellar_labs/ui/shared/colors.dart';
import 'package:interstellar_labs/ui/views/home/nav_bar_pages/events/events_view.dart';
import 'package:interstellar_labs/ui/views/home/nav_bar_pages/movie_reel/movie_reel_view.dart';
import 'package:interstellar_labs/ui/views/home/nav_bar_pages/notification/notification_view.dart';
import 'package:interstellar_labs/ui/views/home/nav_bar_pages/profile/profile_view.dart';

import 'package:interstellar_labs/utils/export_utils.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:stacked/stacked.dart';

import 'nav_bar_viewmodel.dart';

class NavBarView extends StatelessWidget {
  const NavBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NavBarViewModel>.reactive(
      disposeViewModel: false,
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: ThemeColors.backgroundColor,
          body: LazyLoadIndexedStack(
            index: model.currentIndex,
            children: const [
              MovieReel(),
              EventsView(),
              NotificationsView(),
              ProfileView(),
            ],
          ),
          bottomNavigationBar: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              indicatorColor: BrandColors.seaBlueColor,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: BrandColors.seaBlueColor,
              unselectedItemColor: BrandColors.whiteColor,
              backgroundColor: ThemeColors.backgroundColor,
              onTap: model.setIndex,
              currentIndex: model.currentIndex,
              enableFeedback: true,
              items: getBottomIcons(context),
            ),
          ),
        );
      },
      viewModelBuilder: () => NavBarViewModel(),
    );
  }
}

List<BottomNavigationBarItem> getBottomIcons(context) {
  final icons = [
    InterstellarIcons.movieReel,
    InterstellarIcons.eventTicket,
    InterstellarIcons.alarm,
    InterstellarIcons.profile,
  ];

  List<BottomNavigationBarItem> bottomNavList = List.generate(4, (i) {
    var item = BottomNavigationBarItem(
      label: '',
      icon: Padding(
        padding: EdgeInsets.only(bottom: 4.0.h, top: 4.0.h),
        child: Icon(
          icons[i],
          size: 22.w,
          color: BrandColors.whiteColor,
        ),
      ),
      activeIcon: Padding(
        padding: EdgeInsets.only(bottom: 4.0.h, top: 4.0.h),
        child: Icon(
          icons[i],
          size: 24.w,
          color: BrandColors.seaBlueColor,
        ),
      ),
    );

    return item;
  });

  return bottomNavList;
}
