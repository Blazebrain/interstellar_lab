import 'package:interstellar_labs/app/app.locator.dart';
import 'package:interstellar_labs/models/all_movies/all_movies.dart';
import 'package:interstellar_labs/models/genres/genre_model.dart';
import 'package:interstellar_labs/services/local_storage/local_storage.dart';
import 'package:interstellar_labs/services/movies/movies.dart';
import 'package:interstellar_labs/utils/export_utils.dart';
import 'package:stacked/stacked.dart';

class NowPlayingTabVIewModel extends BaseViewModel {
  List<Genres> _genresList = [];
  final _movieService = locator<IMovies>();
  final _localStorage = locator<ILocalStorage>();

  List<AllMovies> _nowShowingMoviesList = [];
  List<AllMovies> get nowShowingMoviesList => _nowShowingMoviesList;

  Future<void> setUp() async {
    await runBusyFuture(runTask());
  }

  Future<void> runTask() async {
    await getGenreList();
    await getNowShowingMovies();
  }

  getGenreList() async {
    _genresList = await _movieService.getMovieGenre();
    notifyListeners();
    await _localStorage.put(StorageKeys.genreBox,
        key: HiveTypeIdKeys.genreTypeIdKey, value: _genresList);
  }

  Future<void> getNowShowingMovies() async {
    _nowShowingMoviesList = await _movieService.getNowPlayingMovies();
  }

  String? getGenreName(int index) {
    final genre = _genresList.where((element) {
      return element.id == _nowShowingMoviesList[index].genreIds![0];
    }).toList();
    return genre[0].name ?? 'Unknown';
  }
}
