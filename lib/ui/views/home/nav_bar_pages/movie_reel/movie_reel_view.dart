import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interstellar_labs/ui/shared/dumb_widgets/const_widgets.dart';
import 'package:interstellar_labs/utils/constants/app_assets.dart';
import 'package:stacked/stacked.dart';

import 'package:interstellar_labs/ui/shared/colors.dart';
import 'package:interstellar_labs/ui/shared/dumb_widgets/const_ui_helpers.dart';
import 'package:interstellar_labs/ui/views/home/nav_bar_pages/movie_reel/tabs/now_playing/now_playing_tab_view.dart';
import 'package:interstellar_labs/ui/views/home/nav_bar_pages/movie_reel/tabs/upcoming/upcoming_tab_view.dart';

import 'movie_reel_viewmodel.dart';

class MovieReel extends StatelessWidget {
  const MovieReel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieReelViewModel>.reactive(
      viewModelBuilder: () => MovieReelViewModel(),
      onModelReady: (model) {
        model.setUp();
      },
      builder: (context, viewModel, child) {
        return SafeArea(
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'Star Movie',
                  style: TextStyle(fontSize: 24.sp),
                ),
                automaticallyImplyLeading: false,
                actions: [
                  GestureDetector(
                    onTap: viewModel.goToSearchView,
                    child: const Icon(Icons.search),
                  ),
                  horizontalSpaceSmall,
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(26.r)),
                        border: Border.all(
                          color: BrandColors.lineWhite,
                        ),
                      ),
                      child: TabBar(
                        indicator: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(50), // Creates border
                          color: BrandColors.mudRedColor,
                        ),
                        tabs: [
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ReusableSvgImage(svgIcon: SvgAssets.playIcon),
                                horizontalSpaceSmall,
                                Text(
                                  'Now Showing',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ],
                            ),
                          ),
                          const Tab(
                            child: Text('Coming Soon'),
                          ),
                        ],
                      ),
                    ),
                    verticalSpaceMedium,
                    const Expanded(
                      child: TabBarView(
                        children: [
                          NowPlayingTabView(),
                          UpcomingTabView(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
