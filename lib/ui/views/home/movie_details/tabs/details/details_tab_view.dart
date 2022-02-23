import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interstellar_labs/models/all_movies/all_movies.dart';
import 'package:interstellar_labs/models/cast_and_crew_model.dart';
import 'package:interstellar_labs/ui/shared/colors.dart';
import 'package:interstellar_labs/ui/shared/dumb_widgets/const_ui_helpers.dart';
import 'package:interstellar_labs/ui/shared/dumb_widgets/const_widgets.dart';
import 'package:interstellar_labs/ui/shared/smart_widgets/reusable_network_image/reusable_network_image.dart';
import 'package:interstellar_labs/ui/views/home/movie_details/tabs/details/widgets/cast_and_crew_tile.dart';
import 'package:stacked/stacked.dart';

import 'details_tab_viewmodel.dart';

class DetailsTabView extends StatefulWidget {
  final AllMovies? movieModel;
  const DetailsTabView({Key? key, this.movieModel}) : super(key: key);

  @override
  State<DetailsTabView> createState() => _DetailsTabViewState();
}

class _DetailsTabViewState extends State<DetailsTabView>
    with AutomaticKeepAliveClientMixin<DetailsTabView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailsTabViewModel>.reactive(
      viewModelBuilder: () => DetailsTabViewModel(),
      onModelReady: (viewModel) => viewModel.setUp(widget.movieModel!.id!),
      builder: (context, viewModel, child) {
        return viewModel.isBusy
            ? const Center(child: ReusableDotProgressIndicator())
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
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
                        widget.movieModel!.overview!,
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
                              'View all',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: BrandColors.seaBlueColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceSmall,
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
                      ),
                      verticalSpaceMedium,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Photos',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                              color: BrandColors.whiteColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              viewModel.goToImagesSeeAllView();
                            },
                            child: Text(
                              'View all',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: BrandColors.seaBlueColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceRegular,
                      SizedBox(
                        height: 72.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return ReusableNetworkImage(
                              height: 100.h,
                              width: 120.w,
                              url:
                                  'https://image.tmdb.org/t/p/original/${viewModel.movieImagesList[index].filePath!}',
                            );
                          },
                        ),
                      ),
                      verticalSpaceMedium,
                    ],
                  ),
                ),
              );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
