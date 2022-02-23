import 'package:interstellar_labs/app/app.locator.dart';
import 'package:interstellar_labs/app/app.router.dart';
import 'package:interstellar_labs/models/all_movies/all_movies.dart';
import 'package:interstellar_labs/services/api/api_service.dart';
import 'package:interstellar_labs/services/movies/movies.dart';
import 'package:interstellar_labs/utils/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const searchBusyKey = 'searchBusyKey';

class SearchViewModel extends BaseViewModel {
  List<AllMovies> searchResults = [];
  final _movieService = locator<IMovies>();
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();

  Future<void> searchForMovie(String searchItem) async {
    try {
      setBusyForObject(searchBusyKey, true);
      searchResults = await _movieService.searchForMovie(searchItem);
      notifyListeners();
      setBusyForObject(searchBusyKey, false);
      goToSearchResultsView(searchItem);
    } on Failure catch (e) {
      setBusyForObject(searchBusyKey, false);
      _snackbarService.showCustomSnackBar(
        message: e.message,
        variant: SnackBarType.error,
      );
    }
  }

  goBack() {
    _navigationService.back();
  }

  void goToSearchResultsView(String? searchItem) {
    _navigationService.navigateTo(
      Routes.searchResultsView,
      arguments: SearchResultsViewArguments(
          searchResults: searchResults, searchItem: searchItem),
    );
  }
}
