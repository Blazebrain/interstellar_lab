import 'package:interstellar_labs/app/app.locator.dart';
import 'package:interstellar_labs/app/app.logger.dart';
import 'package:interstellar_labs/models/cast_and_crew_model.dart';
import 'package:interstellar_labs/models/coming_soon/coming_soon.dart';
import 'package:interstellar_labs/models/genres/genre_model.dart';
import 'package:interstellar_labs/models/movie_details/movie_details.dart';
import 'package:interstellar_labs/models/movie_images.dart';
import 'package:interstellar_labs/models/movie_reviews.dart';
import 'package:interstellar_labs/models/movie_videos.dart';
import 'package:interstellar_labs/models/now_playing/movies_model.dart';
import 'package:interstellar_labs/models/search/search_model.dart';
import 'package:interstellar_labs/services/api/api.dart';
import 'package:interstellar_labs/services/api/api_service.dart';
import 'package:interstellar_labs/services/movies/movies.dart';
import 'package:interstellar_labs/utils/export_utils.dart';

class MoviesService implements IMovies {
  final _apiService = locator<IApi>();
  final log = getLogger('MoviesService');
  @override
  Future getNowPlayingMovies() async {
    try {
      final response = await _apiService.get(ApiConstants.getNowPlayingMovies);

      return NowPlayingResponseModel.fromJson(response).results;
    } catch (e) {
      log.e(e);
      throw Failure(message: e.toString());
    }
  }

  @override
  Future getUpcomingMovies() async {
    try {
      final response = await _apiService.get(ApiConstants.getUpcomingMovies);

      return ComingSoonResponseModel.fromJson(response).results;
    } catch (e) {
      log.e(e);
      throw Failure(message: e.toString());
    }
  }

  @override
  Future getMovieGenre() async {
    try {
      final response = await _apiService.get(ApiConstants.getGenreList);
      return GenreResponseModel.fromJson(response).genres;
    } catch (e) {
      log.e(e);
      throw Failure(message: e.toString());
    }
  }

  @override
  Future searchForMovie(String searchItem) async {
    try {
      final response =
          await _apiService.get(ApiConstants.searchForMovie(searchItem));
      return SearchResponseModel.fromJson(response).results;
    } catch (e) {
      log.e(e);
      throw Failure(message: e.toString());
    }
  }

  @override
  Future getCastAndCrew(int movieId) async {
    final List<CastAndCrew> mergedList = [];
    try {
      final response =
          await _apiService.get(ApiConstants.getCastAndCrew(movieId));
      final cast = CastAndCrewResponseModel.fromJson(response).cast;
      mergedList.addAll(cast!);
      final crew = CastAndCrewResponseModel.fromJson(response).crew;
      mergedList.addAll(crew!);
      return mergedList;
    } catch (e) {
      log.e(e);
      throw Failure(message: e.toString());
    }
  }

  @override
  Future getMovieDetails(int movieId) async {
    try {
      final response =
          await _apiService.get(ApiConstants.getMovieDetails(movieId));
      return MovieDetailResponseModel.fromJson(response);
    } catch (e) {
      log.e(e);
      throw Failure(message: e.toString());
    }
  }

  @override
  Future getMovieImages(int movieId) async {
    try {
      final response =
          await _apiService.get(ApiConstants.getMovieImages(movieId));
      return MovieImagesResponseModel.fromJson(response).posters;
    } catch (e) {
      log.e(e);
      throw Failure(message: e.toString());
    }
  }

  @override
  Future getMovieVideos(int movieId) async {
    try {
      final response =
          await _apiService.get(ApiConstants.getMovieVideos(movieId));
      return MovieVideosResponseModel.fromJson(response).results;
    } catch (e) {
      log.e(e);
      throw Failure(message: e.toString());
    }
  }

  @override
  Future getMovieReviews(int movieId) async {
    try {
      final response =
          await _apiService.get(ApiConstants.getMovieReviews(movieId));
      return MovieReviewsResponseModel.fromJson(response).results;
    } catch (e) {
      log.e(e);
      throw Failure(message: e.toString());
    }
  }
}
