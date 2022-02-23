import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../models/all_movies/all_movies.dart';
import '../../../../../shared/colors.dart';
import '../../../../../shared/dumb_widgets/const_widgets.dart';
import 'reviews_tab_viewmodel.dart';
import 'widgets/review_tile.dart';

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
                              physics: const NeverScrollableScrollPhysics(),
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
