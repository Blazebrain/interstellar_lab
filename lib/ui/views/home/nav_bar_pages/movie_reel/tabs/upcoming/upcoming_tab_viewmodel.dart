import 'package:stacked/stacked.dart';

import '../../../../../../../app/app.locator.dart';
import '../../../../../../../models/all_movies/all_movies.dart';
import '../../../../../../../models/genres/genre_model.dart';
import '../../../../../../../services/movies/movies.dart';

class UpcomingTabViewModel extends BaseViewModel {
  List<Genres> _genresList = [];
  List<AllMovies> _upcomingMoviesList = [];
  List<AllMovies> get upcomingMoviesList => _upcomingMoviesList;
  final _movieService = locator<IMovies>();

  void setUp() async {
    await runBusyFuture(runTask());
  }

  runTask() async {
    await getGenreList();
    await getUpcomingMoviesList();
  }

  Future<void> getUpcomingMoviesList() async {
    _upcomingMoviesList = await _movieService.getUpcomingMovies();
  }

  getGenreList() async {
    _genresList = await _movieService.getMovieGenre();
    // Saves the genresList and Ids to local storage for future comparison
  }

  String? getGenreName(int index) {
    final genre = _genresList.where((element) {
      return element.id == _genresList[index].id;
    }).toList();
    return genre[0].name;
  }
}
