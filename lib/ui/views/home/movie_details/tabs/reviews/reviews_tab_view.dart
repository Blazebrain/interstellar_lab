import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interstellar_labs/models/all_movies/all_movies.dart';
import 'package:interstellar_labs/models/movie_reviews.dart';
import 'package:interstellar_labs/ui/shared/colors.dart';
import 'package:interstellar_labs/ui/shared/dumb_widgets/const_ui_helpers.dart';
import 'package:interstellar_labs/ui/shared/dumb_widgets/const_widgets.dart';
import 'package:interstellar_labs/ui/views/home/movie_details/tabs/reviews/reviews_tab_viewmodel.dart';
import 'package:interstellar_labs/ui/views/home/movie_details/tabs/reviews/widgets/review_tile.dart';
import 'package:stacked/stacked.dart';

class ReviewsTabView extends StatefulWidget {
  final AllMovies? movieModel;
  const ReviewsTabView({Key? key, this.movieModel}) : super(key: key);

  @override
  State<ReviewsTabView> createState() => _ReviewsTabViewState();
}

class _ReviewsTabViewState extends State<ReviewsTabView>
    with AutomaticKeepAliveClientMixin<ReviewsTabView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReviewsTabViewModel>.reactive(
      viewModelBuilder: () => ReviewsTabViewModel(),
      onModelReady: (viewModel) => viewModel.setUp(widget.movieModel!.id!),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: viewModel.isBusy
              ? const Center(
                  child: ReusableDotProgressIndicator(),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    viewModel.movieReviewsList.isEmpty
                        ? Center(
                            child: Text(
                              'Oops! No review here yet',
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: BrandColors.whiteColor,
                              ),
                            ),
                          )
                        : Expanded(
                            child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  color: ThemeColors.dividerColor,
                                  thickness: 1,
                                );
                              },
                              itemCount: viewModel.movieReviewsList.length,
                              itemBuilder: (context, index) {
                                return ReviewTile(
                                  review: viewModel.movieReviewsList[index],
                                );
                              },
                            ),
                          ),
                  ],
                ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
