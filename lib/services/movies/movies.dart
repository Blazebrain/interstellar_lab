abstract class IMovies {
  Future<dynamic> getUpcomingMovies();

  Future<dynamic> getNowPlayingMovies();

  Future<dynamic> getMovieGenre();

  Future<dynamic> searchForMovie(String searchItem);

  Future<dynamic> getCastAndCrew(int movieId);

  Future<dynamic> getMovieDetails(int movieId);

  Future<dynamic> getMovieImages(int movieId);

  Future<dynamic> getMovieVideos(int movieId);
}
