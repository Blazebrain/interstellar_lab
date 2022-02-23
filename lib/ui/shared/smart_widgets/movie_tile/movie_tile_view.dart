import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interstellar_labs/models/all_movies/all_movies.dart';
import 'package:stacked/stacked.dart';

import '../../colors.dart';
import '../../dumb_widgets/const_ui_helpers.dart';
import '../reusable_network_image/reusable_network_image.dart';
import 'movie_tile_viewmodel.dart';

class MovieTile extends StatelessWidget {
  final AllMovies? model;
  final String? genreName;
  const MovieTile({
    Key? key,
    this.genreName,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieTileViewModel>.reactive(
        viewModelBuilder: () => MovieTileViewModel(),
        builder: (context, viewModel, child) {
          return GestureDetector(
            onTap: () {
              viewModel.goToMovieDatailsView(model);
            },
            child: Center(
              child: Container(
                margin: EdgeInsets.only(left: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableNetworkImage(
                      height: 300.h,
                      width: 187.w,
                      fit: BoxFit.cover,
                      url:
                          'https://image.tmdb.org/t/p/original/${model!.posterPath!}',
                    ),
                    verticalSpaceRegular,
                    RatingBar.builder(
                      initialRating: model!.voteAverage! / 2,
                      itemSize: 15.h,
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
                    verticalSpaceSmall,
                    SizedBox(
                      width: 167.w,
                      child: Text(
                        model!.title!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: BrandColors.whiteColor,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    verticalSpaceTiny,
                    if (genreName != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            genreName!,
                            style: TextStyle(
                              color: BrandColors.whiteColor,
                              fontSize: 12.sp,
                            ),
                          )
                        ],
                      )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
