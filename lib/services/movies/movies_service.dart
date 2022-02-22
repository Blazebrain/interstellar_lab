import 'package:interstellar_labs/app/app.locator.dart';
import 'package:interstellar_labs/models/now_playing/movies_model.dart';
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
  Future getUpcomingMovies() {
    // TODO: implement getUpcomingMovies
    throw UnimplementedError();
  }
}
