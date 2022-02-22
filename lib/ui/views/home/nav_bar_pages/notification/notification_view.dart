import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'notification_viewmodel.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NotificationViewModel>.reactive(
      viewModelBuilder: () => NotificationViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold();
      },
    );
  }
}
