import 'package:interstellar_labs/app/app.locator.dart';
import 'package:interstellar_labs/models/cast_and_crew_model.dart';
import 'package:interstellar_labs/models/coming_soon/coming_soon.dart';
import 'package:interstellar_labs/models/genres/genre_model.dart';
import 'package:interstellar_labs/models/now_playing/movies_model.dart';
import 'package:interstellar_labs/models/search/search_model.dart';
import 'package:interstellar_labs/services/api/api.dart';
import 'package:interstellar_labs/services/api/api_service.dart';
import 'package:interstellar_labs/services/movies/movies.dart';
import 'package:interstellar_labs/utils/export_utils.dart';

class MoviesService implements IMovies {
  final _apiService = locator<IApi>();
  @override
  Future getNowPlayingMovies() async {
    try {
      final response = await _apiService.get(ApiConstants.getNowPlayingMovies);

      return NowPlayingResponseModel.fromJson(response).results;
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  @override
  Future getUpcomingMovies() async {
    try {
      final response = await _apiService.get(ApiConstants.getUpcomingMovies);

      return ComingSoonResponseModel.fromJson(response).results;
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

  @override
  Future getMovieGenre() async {
    try {
      final response = await _apiService.get(ApiConstants.getGenreList);
      return GenreResponseModel.fromJson(response).genres;
    } catch (e) {
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
      throw Failure(message: e.toString());
    }
  }

  @override
  Future getMovieDetails(int movieId) {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }

  @override
  Future getMovieImages(int movieId) {
    // TODO: implement getMovieImages
    throw UnimplementedError();
  }

  @override
  Future getMovieVideos(int movieId) {
    // TODO: implement getMovieVideos
    throw UnimplementedError();
  }
}
