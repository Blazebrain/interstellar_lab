import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interstellar_labs/models/cast_and_crew_model.dart';
import 'package:interstellar_labs/ui/shared/colors.dart';
import 'package:interstellar_labs/ui/shared/dumb_widgets/const_ui_helpers.dart';

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
