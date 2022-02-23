import 'package:interstellar_labs/app/app.locator.dart';
import 'package:interstellar_labs/models/cast_and_crew_model.dart';
import 'package:interstellar_labs/services/movies/movies.dart';
import 'package:stacked/stacked.dart';

class DetailsTabViewModel extends BaseViewModel {
  final _movieService = locator<IMovies>();
  List<CastAndCrew> castAndCrewList = [];
  setUp() async {
    await runBusyFuture(runTasks());
  }

  Future<void> runTasks() async {}

  Future getMovieDetails() async {
    // _movieService.g
    try {} catch (e) {}
  }

  Future getCastAndCrew(int movieId) async {
    castAndCrewList = await _movieService.getCastAndCrew(movieId);
  }

  Future getImages() async {}

  Future getVideos() async {}
}
