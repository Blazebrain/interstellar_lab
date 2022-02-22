import 'package:flutter/material.dart';
import 'package:interstellar_labs/ui/views/home/search/search_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SearchViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold();
      },
    );
  }
}
