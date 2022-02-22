/// Api constants for endpoints and other network related fields
class ApiConstants {
  static const httpScheme = 'http';
  static const httpsScheme = 'https';

  /// tmdb api constants
  static const tmdbApiHost = 'api.themoviedb.org';
  static const tmdbApiVersion = '3';
  static const movieEndpoint = '/movie';
  static const apiKey = '7239fd4bdd285b8bf64931217bf1e9b7';

  /// Api request related options
  static const receiveTimeout = 5000;
  static const sendTimeout = 3000;
  static const connectTimeout = 10000;

  // Base Uris

  /// Raptures
  static get tmdbBaseUri =>
      Uri(scheme: httpsScheme, host: tmdbApiHost, path: '/');

  // Endpoints

  /// tmdb
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
}
