/// Api constants for endpoints and other network related fields
class ApiConstants {
  static const httpScheme = 'http';
  static const httpsScheme = 'https';

  /// tmdb api constants
  static const tmdbApiHost = 'api.themoviedb.org';
  static const tmdbApiVersion = '3';
  static const genreEndpoint = '/genre';
  static const searchEndpoint = '/search';
  static const movieEndpoint = '/movie';
  static const apiKey = '7239fd4bdd285b8bf64931217bf1e9b7';

  /// Api request related options
  static const receiveTimeout = 5000;
  static const sendTimeout = 3000;
  static const connectTimeout = 10000;

  // Base Uris
  static get tmdbBaseUri =>
      Uri(scheme: httpsScheme, host: tmdbApiHost, path: '/');

  // Endpoints
  static get getNowPlayingMovies => Uri(
        scheme: httpsScheme,
        host: tmdbApiHost,
        path: '$tmdbApiVersion$movieEndpoint/now_playing/',
        query: 'api_key=$apiKey',
      );

  static get getUpcomingMovies => Uri(
        scheme: httpsScheme,
        host: tmdbApiHost,
        path: '$tmdbApiVersion$movieEndpoint/upcoming/',
        query: 'api_key=$apiKey',
      );

  static get getGenreList => Uri(
        scheme: httpsScheme,
        host: tmdbApiHost,
        path: '$tmdbApiVersion$genreEndpoint$movieEndpoint/list',
        query: 'api_key=$apiKey',
      );

  static Uri searchForMovie(String searchItem) => Uri(
        scheme: httpsScheme,
        host: tmdbApiHost,
        path: '$tmdbApiVersion$searchEndpoint$movieEndpoint',
        query: 'api_key=$apiKey&query=$searchItem',
      );

  static Uri getMovieDetails(int? movieId) => Uri(
        scheme: httpsScheme,
        host: tmdbApiHost,
        path: '$tmdbApiVersion$movieEndpoint/$movieId',
        query: 'api_key=$apiKey',
      );

  static Uri getCastAndCrew(int movieId) => Uri(
        scheme: httpsScheme,
        host: tmdbApiHost,
        path: '$tmdbApiVersion$movieEndpoint/$movieId/credits',
        query: 'api_key=$apiKey',
      );

  static Uri getMovieImages(int movieId) => Uri(
        scheme: httpsScheme,
        host: tmdbApiHost,
        path: '$tmdbApiVersion$movieEndpoint/$movieId/images',
        query: 'api_key=$apiKey',
      );

  static Uri getMovieVideos(int movieId) => Uri(
        scheme: httpsScheme,
        host: tmdbApiHost,
        path: '$tmdbApiVersion$movieEndpoint/$movieId/videos',
        query: 'api_key=$apiKey',
      );

  static Uri getMovieReviews(int movieId) => Uri(
        scheme: httpsScheme,
        host: tmdbApiHost,
        path: '$tmdbApiVersion$movieEndpoint/$movieId/reviews',
        query: 'api_key=$apiKey',
      );
}
