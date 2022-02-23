import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interstellar_labs/models/all_movies/all_movies.dart';
import 'package:interstellar_labs/ui/shared/colors.dart';
import 'package:interstellar_labs/ui/shared/dumb_widgets/const_ui_helpers.dart';
import 'package:interstellar_labs/ui/shared/dumb_widgets/const_widgets.dart';
import 'package:interstellar_labs/ui/shared/smart_widgets/reusable_network_image/reusable_network_image.dart';
import 'package:interstellar_labs/ui/views/home/movie_details/tabs/details/details_tab_view.dart';
import 'package:interstellar_labs/ui/views/home/movie_details/tabs/reviews/reviews_tab_view.dart';
import 'package:interstellar_labs/ui/views/home/movie_details/tabs/showtime/show_time_tab_view.dart';
import 'package:stacked/stacked.dart';

import 'movie_details_viewmodel.dart';

class MovieDetailsView extends StatelessWidget {
  final AllMovies? model;
  const MovieDetailsView({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieDetailsViewModel>.reactive(
      viewModelBuilder: () => MovieDetailsViewModel(),
      onModelReady: (viewModel) {
        viewModel.setUp(model!.genreIds);
      },
      builder: (context, viewModel, child) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 200,
                  flexibleSpace: FlexibleSpaceBar(
                    background: ReusableNetworkImage(
                      url:
                          'https://image.tmdb.org/t/p/original/${model!.posterPath!}',
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          verticalSpaceExtraMedium,
                          Text(
                            model!.title!,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24.sp,
                              color: BrandColors.whiteColor,
                            ),
                          ),
                          verticalSpaceRegular,
                          Text(
                            '2hr 10m | R',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: BrandColors.whiteColor.withOpacity(0.5),
                            ),
                          ),
                          verticalSpaceSmall,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: viewModel.genreNames
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e,
                                      style: TextStyle(
                                        color: BrandColors.whiteColor
                                            .withOpacity(0.55),
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          verticalSpaceMedium,
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(26.r)),
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
                                  child: Text(
                                    'Details',
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                ),
                                const Tab(
                                  child: Text('Review'),
                                ),
                                const Tab(
                                  child: Text('Showtime'),
                                ),
                              ],
                            ),
                          ),
                          // SliverFillViewport(delegate: SliverDelegate,)
                        ],
                      )
                    ],
                  ),
                ),
                const SliverFillRemaining(
                  // hasScrollBody: false,
                  child: TabBarView(
                    children: [
                      DetailsTabView(),
                      ReviewsTabView(),
                      ShowTimeTabView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
