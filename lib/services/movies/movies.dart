abstract class IMovies {
  Future<dynamic> getUpcomingMovies();

  Future<dynamic> getNowPlayingMovies();

  Future<dynamic> getMovieGenre();

  Future<dynamic> searchForMovie(String searchItem);
}
