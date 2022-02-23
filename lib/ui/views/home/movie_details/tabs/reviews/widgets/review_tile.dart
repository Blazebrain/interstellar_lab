import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interstellar_labs/models/movie_reviews.dart';
import 'package:interstellar_labs/ui/shared/colors.dart';
import 'package:interstellar_labs/ui/shared/dumb_widgets/const_ui_helpers.dart';

class ReviewTile extends StatelessWidget {
  final MovieReview? review;
  const ReviewTile({
    Key? key,
    this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h, left: 14.w),
      // height: 49.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (review!.authorDetails!.avatarPath != null) ...[
            CircleAvatar(
              backgroundColor: ThemeColors.grayColor.withOpacity(0.5),
              radius: 35.r,
              backgroundImage: NetworkImage(
                review!.authorDetails!.avatarPath!.replaceFirst('/', ''),
              ),
            )
          ],
          if (review!.authorDetails!.avatarPath == null) ...[
            CircleAvatar(
              backgroundColor: ThemeColors.grayColor.withOpacity(0.5),
              radius: 35.r,
            )
          ],
          horizontalSpaceRegular,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review!.author!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: BrandColors.whiteColor,
                  ),
                ),
                verticalSpaceRegular,
                Text(
                  review!.content!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: BrandColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
