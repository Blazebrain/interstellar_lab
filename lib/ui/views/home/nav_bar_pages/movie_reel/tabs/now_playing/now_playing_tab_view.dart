import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../../../shared/dumb_widgets/const_widgets.dart';
import '../../../../../../shared/smart_widgets/movie_tile/movie_tile_view.dart';
import 'now_playing_tab_viewmodel.dart';

class NowPlayingTabView extends StatefulWidget {
  const NowPlayingTabView({Key? key}) : super(key: key);

  @override
  State<NowPlayingTabView> createState() => _NowPlayingTabViewState();
}

class _NowPlayingTabViewState extends State<NowPlayingTabView>
    with AutomaticKeepAliveClientMixin<NowPlayingTabView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NowPlayingTabVIewModel>.reactive(
      viewModelBuilder: () => NowPlayingTabVIewModel(),
      onModelReady: (model) => model.setUp(),
      builder: (context, viewModel, child) {
        return viewModel.isBusy
            ? const Center(
                child: ReusableDotProgressIndicator(),
              )
            : Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 167.w / 347.h,
                  ),
                  itemCount: viewModel.nowShowingMoviesList.length,
                  itemBuilder: (context, index) {
                    return MovieTile(
                      model: viewModel.nowShowingMoviesList[index],
                      genreName: viewModel.getGenreName(index),
                    );
                  },
                ),
              );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
