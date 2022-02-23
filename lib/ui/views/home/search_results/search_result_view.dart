import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interstellar_labs/models/all_movies/all_movies.dart';
import 'package:interstellar_labs/ui/shared/colors.dart';
import 'package:interstellar_labs/ui/shared/dumb_widgets/const_widgets.dart';
import 'package:interstellar_labs/ui/shared/smart_widgets/movie_tile/movie_tile_view.dart';
import 'package:stacked/stacked.dart';

import 'search_results_viewmodel.dart';

class SearchResultsView extends StatelessWidget {
  final String? searchItem;
  final List<AllMovies>? searchResults;

  const SearchResultsView({Key? key, this.searchResults, this.searchItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchResultsViewModel>.reactive(
      viewModelBuilder: () => SearchResultsViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Search Results'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Row(
                  children: [
                    const Text(
                      'Search > ',
                      style: TextStyle(color: BrandColors.whiteColor),
                    ),
                    Text(
                      searchItem ?? '',
                      style: const TextStyle(color: BrandColors.whiteColor),
                    ),
                  ],
                ),
              ),
              viewModel.isBusy
                  ? const Expanded(
                      child: Center(
                        child: ReusableDotProgressIndicator(
                          color: BrandColors.mudRedColor,
                        ),
                      ),
                    )
                  : searchResults!.isEmpty
                      ? Expanded(
                          child: Center(
                            child:
                                Text('No Movie found with tag: $searchItem '),
                          ),
                        )
                      : Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 167.w / 347.h,
                            ),
                            itemCount: 5,
                            //  viewModel.nowShowingMoviesList.length,
                            itemBuilder: (context, index) {
                              return MovieTile(
                                model: searchResults![index],
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
}
