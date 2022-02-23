import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interstellar_labs/models/all_movies/all_movies.dart';
import 'package:interstellar_labs/ui/shared/colors.dart';
import 'package:interstellar_labs/ui/shared/dumb_widgets/const_ui_helpers.dart';
import 'package:interstellar_labs/ui/shared/dumb_widgets/const_widgets.dart';
import 'package:interstellar_labs/ui/shared/smart_widgets/reusable_network_image/reusable_network_image.dart';
import 'package:interstellar_labs/ui/views/home/movie_details/tabs/details/details_tab_view.dart';
import 'package:interstellar_labs/ui/views/home/movie_details/tabs/reviews/reviews_tab_view.dart';
import 'package:interstellar_labs/ui/views/home/movie_details/tabs/showtime/show_time_tab_view.dart';
import 'package:interstellar_labs/utils/export_utils.dart';
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
                expandedHeight: 280,
                leading: GestureDetector(
                  onTap: () {
                    viewModel.goBack();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
                centerTitle: true,
                title: Container(
                  margin: EdgeInsets.only(top: 16.h),
                  child: Icon(
                    Icons.play_circle_rounded,
                    size: 48.w,
                    color: BrandColors.whiteColor.withOpacity(0.7),
                  ),
                ),
                actions: [
                  Container(
                    margin: EdgeInsets.only(right: 16.h),
                    child: ReusableSvgImage(
                      svgIcon: SvgAssets.responseArrow,
                      size: 24.w,
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ReusableNetworkImage(
                        opacity: 0.5,
                        height: 262.h,
                        width: 1.sw,
                        url:
                            'https://image.tmdb.org/t/p/original/${model!.posterPath!}',
                      ),
                      Positioned(
                        top: 0,
                        bottom: -112,
                        left: 0.5.sw - 83.w,
                        child: Center(
                          child: ReusableNetworkImage(
                            height: 320.h,
                            width: 167.w,
                            url:
                                'https://image.tmdb.org/t/p/original/${model!.posterPath!}',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    verticalSpaceMedium,
                    Text(
                      model!.title!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24.sp,
                        color: BrandColors.whiteColor,
                      ),
                    ),
                    verticalSpaceRegular,
                    Text(
                      '2hr 10m | R',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
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
                                  fontWeight: FontWeight.w400,
                                  color:
                                      BrandColors.whiteColor.withOpacity(0.55),
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    verticalSpaceMedium,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${model!.voteAverage! / 2}/5',
                          style: TextStyle(
                            fontSize: 24.sp,
                            color: BrandColors.whiteColor,
                          ),
                        ),
                        horizontalSpaceTiny,
                        RatingBar.builder(
                          initialRating: model!.voteAverage! / 2,
                          itemSize: 24.h,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0.w),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            // print(rating);
                          },
                        ),
                      ],
                    ),
                    verticalSpaceLarge,
                    Container(
                      height: 36.h,
                      margin: EdgeInsets.symmetric(horizontal: 18.w),
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
                            // height: 30.h,
                            child: Text(
                              'Details',
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                          const Tab(
                            // height: 30.h,
                            child: Text('Review'),
                          ),
                          const Tab(
                            // height: 30.h,
                            child: Text('Showtime'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                // hasScrollBody: false,
                child: TabBarView(
                  children: [
                    DetailsTabView(movieModel: model),
                    ReviewsTabView(movieModel: model),
                    const ShowTimeTabView(),
                  ],
                ),
              ),
            ],
          )),
        );
      },
    );
  }
}
