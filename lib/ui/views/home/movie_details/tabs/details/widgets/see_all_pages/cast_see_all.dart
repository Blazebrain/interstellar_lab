import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interstellar_labs/models/cast_and_crew_model.dart';
import 'package:interstellar_labs/ui/shared/colors.dart';
import 'package:interstellar_labs/ui/shared/dumb_widgets/const_ui_helpers.dart';
import 'package:interstellar_labs/ui/views/home/movie_details/tabs/details/details_tab_view.dart';

import '../cast_and_crew_tile.dart';

class CastSeeAllView extends StatelessWidget {
  final List<CastAndCrew>? castAndCrewList;
  const CastSeeAllView({Key? key, this.castAndCrewList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cast & Crew'),
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
                itemCount: castAndCrewList!.length,
                itemBuilder: (context, index) {
                  return CastAndCrewTile(
                    model: castAndCrewList![index],
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
