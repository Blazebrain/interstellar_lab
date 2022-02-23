import 'package:interstellar_labs/app/app.locator.dart';
import 'package:interstellar_labs/models/movie_reviews.dart';
import 'package:interstellar_labs/services/api/api_service.dart';
import 'package:interstellar_labs/services/movies/movies.dart';
import 'package:interstellar_labs/utils/export_utils.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ReviewsTabViewModel extends BaseViewModel {
  final _movieService = locator<IMovies>();
  final _snackbarService = locator<SnackbarService>();

  List<MovieReview> _movieReviewsList = [];
  List<MovieReview> get movieReviewsList => _movieReviewsList;

  Future<void> setUp(int movieId) async {
    await runBusyFuture(runTasks(movieId));
  }

  Future<void> runTasks(int movieId) async {
    await getMovieReviews(movieId);
  }

  Future getMovieReviews(int movieId) async {
    try {
      _movieReviewsList = await _movieService.getMovieReviews(movieId);
    } on Failure catch (e) {
      _snackbarService.showCustomSnackBar(
        message: e.message,
        variant: SnackBarType.error,
      );
    }
  }
}
