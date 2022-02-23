import 'package:interstellar_labs/app/app.locator.dart';
import 'package:interstellar_labs/app/app.router.dart';
import 'package:interstellar_labs/models/all_movies/all_movies.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MovieTileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void goToMovieDatailsView(AllMovies? movieModel) {
    _navigationService.navigateTo(Routes.movieDetailsView,
        arguments: MovieDetailsViewArguments(model: movieModel));
  }
}
