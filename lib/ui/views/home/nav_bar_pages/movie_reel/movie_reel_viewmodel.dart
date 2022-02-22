import 'package:interstellar_labs/app/app.locator.dart';
import 'package:interstellar_labs/models/all_movies/all_movies.dart';
import 'package:interstellar_labs/services/movies/movies.dart';
import 'package:stacked/stacked.dart';

class MovieReelViewModel extends BaseViewModel {
  List<AllMovies> _nowShowingMoviesList = [];
  final _movieService = locator<IMovies>();
  void setUp() async {
    runBusyFuture(await runTask());
  }

  runTask() async {
    await getNowShowingMovies();
  }

  Future<void> getNowShowingMovies() async {
    _nowShowingMoviesList = await _movieService.getNowPlayingMovies();
  }
}
