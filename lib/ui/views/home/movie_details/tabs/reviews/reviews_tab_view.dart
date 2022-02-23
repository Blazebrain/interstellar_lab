import 'package:flutter/material.dart';
import 'package:interstellar_labs/ui/views/home/movie_details/tabs/reviews/reviews_tab_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ReviewsTabView extends StatelessWidget {
  const ReviewsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ReviewsTabViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold();
      },
    );
  }
}
