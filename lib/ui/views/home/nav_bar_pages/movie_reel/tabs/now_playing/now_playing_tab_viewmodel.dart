import 'package:interstellar_labs/app/app.locator.dart';
import 'package:interstellar_labs/models/all_movies/all_movies.dart';
import 'package:interstellar_labs/models/genres/genre_model.dart';
import 'package:interstellar_labs/services/movies/movies.dart';
import 'package:stacked/stacked.dart';

class NowPlayingTabVIewModel extends BaseViewModel {
  List<Genres> _genresList = [];
  List<AllMovies> _nowShowingMoviesList = [];

  List<AllMovies> get nowShowingMoviesList => _nowShowingMoviesList;
  final _movieService = locator<IMovies>();
  void setUp() async {
    await runBusyFuture(runTask());
  }

  runTask() async {
    await getGenreList();
    await getNowShowingMovies();
  }

  getGenreList() async {
    _genresList = await _movieService.getMovieGenre();
  }

  Future<void> getNowShowingMovies() async {
    _nowShowingMoviesList = await _movieService.getNowPlayingMovies();
  }

  String? getGenreName(int index) {
    final genre = _genresList.where((element) {
      return element.id == _genresList[index].id;
    }).toList();
    return genre[0].name;
  }
}
