import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'details_tab_viewmodel.dart';

class DetailsTabView extends StatelessWidget {
  const DetailsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => DetailsTabViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold();
      },
    );
  }
}
