import 'package:flutter/material.dart';
import 'package:interstellar_labs/ui/shared/colors.dart';
import 'package:interstellar_labs/ui/views/home/nav_bar_pages/movie_reel/tabs/now_playing/now_playing_tab_view.dart';
import 'package:interstellar_labs/ui/views/home/nav_bar_pages/movie_reel/tabs/upcoming/upcoming_tab_view.dart';

import 'package:stacked/stacked.dart';

import 'movie_reel_viewmodel.dart';

class MovieReel extends StatelessWidget {
  const MovieReel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieReelViewModel>.reactive(
      viewModelBuilder: () => MovieReelViewModel(),
      onModelReady: (model) {
        model.setUp();
      },
      builder: (context, viewModel, child) {
        // viewModel.setUp();
        return SafeArea(
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: ThemeColors.backgroundColor,
              appBar: AppBar(
                backgroundColor: ThemeColors.backgroundColor,
                elevation: 0.0,
              ),
              body: Column(
                children: [
                  Container(
                    child: TabBar(
                      indicator: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(50), // Creates border
                          color: Colors.greenAccent),
                      tabs: [
                        Tab(
                          child: Text('Now Showing'),
                        ),
                        Tab(
                          child: Text('Coming Soon'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        NowPlayingTabView(),
                        UpcomingTabView(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
