import 'package:flutter/material.dart';
import 'package:interstellar_labs/models/all_movies/all_movies.dart';
import 'package:interstellar_labs/ui/views/home/movie_details/tabs/reviews/reviews_tab_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ReviewsTabView extends StatelessWidget {
  final AllMovies? movieModel;
  const ReviewsTabView({Key? key, this.movieModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReviewsTabViewModel>.reactive(
      viewModelBuilder: () => ReviewsTabViewModel(),
      onModelReady: (viewModel) => viewModel.setUp(movieModel!.id!),
      builder: (context, viewModel, child) {
        return Scaffold();
      },
    );
  }
}
