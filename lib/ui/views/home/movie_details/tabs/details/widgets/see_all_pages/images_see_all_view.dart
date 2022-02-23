import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interstellar_labs/models/movie_images.dart';
import 'package:interstellar_labs/ui/shared/colors.dart';
import 'package:interstellar_labs/ui/shared/dumb_widgets/const_ui_helpers.dart';
import 'package:interstellar_labs/ui/shared/smart_widgets/reusable_network_image/reusable_network_image.dart';

class ImagesSeeAllView extends StatelessWidget {
  final List<Posters>? imagesList;

  const ImagesSeeAllView({Key? key, this.imagesList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Divider(
            thickness: 1.0,
            color: ThemeColors.dividerColor.withOpacity(0.3),
          ),
          verticalSpaceRegular,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: ListView.builder(
                itemCount: imagesList!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 16.h),
                    child: ReusableNetworkImage(
                      height: 224.h,
                      url:
                          'https://image.tmdb.org/t/p/original/${imagesList![index].filePath!}',
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
