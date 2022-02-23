import 'package:interstellar_labs/app/app.locator.dart';
import 'package:interstellar_labs/app/app.logger.dart';
import 'package:interstellar_labs/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchResultsViewModel extends BaseViewModel {
  final log = getLogger('GenreSearchResultsViewModel');

  final _navigationService = locator<NavigationService>();

  void goToDashboard() {
    _navigationService.navigateTo(Routes.navBarView);
  }
}
