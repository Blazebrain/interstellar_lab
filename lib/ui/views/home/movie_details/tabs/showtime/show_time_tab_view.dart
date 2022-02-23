import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'show_time_tab_viewmodel.dart';

class ShowTimeTabView extends StatelessWidget {
  const ShowTimeTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ShowTimeTabViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold();
      },
    );
  }
}
