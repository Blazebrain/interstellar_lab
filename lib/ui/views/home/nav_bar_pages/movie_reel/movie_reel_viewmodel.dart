import 'package:interstellar_labs/app/app.locator.dart';
import 'package:interstellar_labs/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MovieReelViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void setUp() async {}

  void goToSearchView() {
    _navigationService.navigateTo(Routes.searchView);
  }
}
