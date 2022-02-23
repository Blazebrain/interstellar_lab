// ignore_for_file: prefer_final_fields

import 'package:interstellar_labs/app/app.locator.dart';
import 'package:interstellar_labs/app/app.router.dart';
import 'package:interstellar_labs/models/cast_and_crew_model.dart';
import 'package:interstellar_labs/models/movie_details/movie_details.dart';
import 'package:interstellar_labs/models/movie_images.dart';
import 'package:interstellar_labs/models/movie_videos.dart';
import 'package:interstellar_labs/services/api/api_service.dart';
import 'package:interstellar_labs/services/movies/movies.dart';
import 'package:interstellar_labs/utils/enums.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DetailsTabViewModel extends BaseViewModel {
  final _movieService = locator<IMovies>();
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();

  List<CastAndCrew> _castAndCrewList = [];
  List<CastAndCrew> get castAndCrew => _castAndCrewList;

  List<MovieImagesResponseModel> _movieImagesList = [];
  List<MovieImagesResponseModel> get movieImagesList => _movieImagesList;

  List<Videos> _movieVideosList = [];
  List<Videos> get movieVideosList => _movieVideosList;

  MovieDetailResponseModel? movieDetails;

  Future<void> setUp(int movieId) async {
    await runBusyFuture(runTasks(movieId));
  }

  Future<void> runTasks(int movieId) async {
    await getMovieDetails(movieId);
    await getCastAndCrew(movieId);
    await getMovieImages(movieId);
    await getMovieVideos(movieId);
  }

  Future getMovieDetails(int movieId) async {
    try {
      movieDetails = await _movieService.getMovieDetails(movieId);
    } on Failure catch (e) {
      _snackbarService.showCustomSnackBar(
        message: e.message,
        variant: SnackBarType.error,
      );
    }
  }

  Future getCastAndCrew(int movieId) async {
    try {
      _castAndCrewList = await _movieService.getCastAndCrew(movieId);
    } on Failure catch (e) {
      _snackbarService.showCustomSnackBar(
        message: e.message,
        variant: SnackBarType.error,
      );
    }
  }

  Future getMovieImages(int movieId) async {
    try {
      _movieImagesList = await _movieService.getMovieImages(movieId);
    } on Failure catch (e) {
      _snackbarService.showCustomSnackBar(
        message: e.message,
        variant: SnackBarType.error,
      );
    }
  }

  Future getMovieVideos(int movieId) async {
    try {
      _movieVideosList = await _movieService.getMovieVideos(movieId);
    } on Failure catch (e) {
      _snackbarService.showCustomSnackBar(
        message: e.message,
        variant: SnackBarType.error,
      );
    }
  }

  void goToCastAndCrewSeeAllView() {
    _navigationService.navigateTo(
      Routes.castSeeAllView,
      arguments: CastSeeAllViewArguments(
        castAndCrewList: _castAndCrewList,
      ),
    );
  }

  void goToImagesSeeAllView() {
    _navigationService.navigateTo(
      Routes.imagesSeeAllView,
      arguments: ImagesSeeAllViewArguments(imagesList: _movieImagesList),
    );
  }

  void goToVideosSeeAllView() {
    _navigationService.navigateTo(Routes.videosSeeAllView,
        arguments: VideosSeeAllViewArguments(videosList: _movieVideosList));
  }
}
