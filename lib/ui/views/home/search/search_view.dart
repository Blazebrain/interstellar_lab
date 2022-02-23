import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interstellar_labs/ui/shared/colors.dart';
import 'package:interstellar_labs/ui/shared/dumb_widgets/const_ui_helpers.dart';
import 'package:interstellar_labs/ui/shared/dumb_widgets/const_widgets.dart';
import 'package:interstellar_labs/ui/shared/dumb_widgets/reusable_button.dart';
import 'package:interstellar_labs/ui/shared/dumb_widgets/reusable_text_field.dart';
import 'package:interstellar_labs/ui/views/home/search/search_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SearchView extends HookWidget {
  final _formKey = GlobalKey<FormState>();
  SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    final searchFocusNode = useFocusNode();

    return ViewModelBuilder<SearchViewModel>.reactive(
      viewModelBuilder: () => SearchViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Search'),
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                viewModel.goBack();
              },
              child: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Search Favorite Movies',
                    style: TextStyle(
                      fontSize: 32.sp,
                      color: BrandColors.whiteColor,
                    ),
                  ),
                  verticalSpaceLarge,
                  ReusableTextField(
                    controller: searchController,
                    focusNode: searchFocusNode,
                    hintText: 'search',
                  ),
                  verticalSpaceLarge,
                  ReusableButton(
                    height: 68.h,
                    width: 200.w,
                    backgroundColor: ThemeColors.splashOneColor,
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      await viewModel.searchForMovie(searchController.text);
                    },
                    label: 'Search',
                    labelTextStyle: TextStyle(
                      color: BrandColors.whiteColor,
                      fontSize: 18.sp,
                    ),
                    customChild: viewModel.busy(searchBusyKey)
                        ? const ReusableDotProgressIndicator()
                        : null,
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
