import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interstellar_labs/models/all_movies/all_movies.dart';
import 'package:interstellar_labs/models/cast_and_crew_model.dart';
import 'package:interstellar_labs/ui/shared/colors.dart';
import 'package:interstellar_labs/ui/shared/dumb_widgets/const_ui_helpers.dart';
import 'package:interstellar_labs/ui/shared/dumb_widgets/const_widgets.dart';
import 'package:interstellar_labs/ui/shared/smart_widgets/reusable_network_image/reusable_network_image.dart';
import 'package:stacked/stacked.dart';

import 'details_tab_viewmodel.dart';

class DetailsTabView extends StatelessWidget {
  final AllMovies? movieModel;
  const DetailsTabView({Key? key, this.movieModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailsTabViewModel>.reactive(
      viewModelBuilder: () => DetailsTabViewModel(),
      onModelReady: (viewModel) => viewModel.setUp(movieModel!.id!),
      builder: (context, viewModel, child) {
        return viewModel.isBusy
            ? const Center(child: ReusableDotProgressIndicator())
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpaceExtraMedium,
                      Text(
                        'Synopsis',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          color: BrandColors.whiteColor,
                        ),
                      ),
                      verticalSpaceRegular,
                      Text(
                        movieModel!.overview!,
                        maxLines: 4,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: BrandColors.whiteColor.withOpacity(0.7),
                        ),
                      ),
                      verticalSpaceMedium,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cast & Crew',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                              color: BrandColors.whiteColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              viewModel.goToCastAndCrewSeeAllView();
                            },
                            child: Text(
                              'see all',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: BrandColors.seaBlueColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceMedium,
                      SizedBox(
                        height: 500.h,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return CastAndCrewTile(
                              model: viewModel.castAndCrew[index],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
      },
    );
  }
}

class CastAndCrewTile extends StatelessWidget {
  final CastAndCrew? model;
  const CastAndCrewTile({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      // height: 49.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: ThemeColors.grayColor.withOpacity(0.5),
            radius: 49.r,
            backgroundImage: NetworkImage(
                'https://image.tmdb.org/t/p/original/${model!.profilePath}'),
          ),
          horizontalSpaceRegular,
          SizedBox(
            width: 100.w,
            child: Text(
              model!.originalName!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: BrandColors.whiteColor,
              ),
            ),
          ),
          horizontalSpaceMedium,
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.more_horiz,
              color: BrandColors.whiteColor,
            ),
          ),
          horizontalSpaceMedium,
          Expanded(
            child: Text(
              model!.character ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: BrandColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
