// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../models/all_movies/all_movies.dart';
import '../models/cast_and_crew_model.dart';
import '../models/movie_images.dart';
import '../models/movie_videos.dart';
import '../ui/views/home/movie_details/movie_details_view.dart';
import '../ui/views/home/movie_details/tabs/details/widgets/see_all_pages/cast_see_all.dart';
import '../ui/views/home/movie_details/tabs/details/widgets/see_all_pages/images_see_all_view.dart';
import '../ui/views/home/movie_details/tabs/details/widgets/see_all_pages/videos_see_all.dart';
import '../ui/views/home/nav_bar/nav_bar_view.dart';
import '../ui/views/home/nav_bar_pages/events/events_view.dart';
import '../ui/views/home/nav_bar_pages/movie_reel/movie_reel_view.dart';
import '../ui/views/home/nav_bar_pages/notification/notification_view.dart';
import '../ui/views/home/nav_bar_pages/profile/profile_view.dart';
import '../ui/views/home/search/search_view.dart';
import '../ui/views/home/search_results/search_result_view.dart';
import '../ui/views/startup/startup_view.dart';

class Routes {
  static const String startUpView = '/start-up-view';
  static const String searchView = '/search-view';
  static const String searchResultsView = '/search-results-view';
  static const String movieDetailsView = '/movie-details-view';
  static const String castSeeAllView = '/cast-see-all-view';
  static const String imagesSeeAllView = '/images-see-all-view';
  static const String videosSeeAllView = '/videos-see-all-view';
  static const String navBarView = '/nav-bar-view';
  static const all = <String>{
    startUpView,
    searchView,
    searchResultsView,
    movieDetailsView,
    castSeeAllView,
    imagesSeeAllView,
    videosSeeAllView,
    navBarView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.searchView, page: SearchView),
    RouteDef(Routes.searchResultsView, page: SearchResultsView),
    RouteDef(Routes.movieDetailsView, page: MovieDetailsView),
    RouteDef(Routes.castSeeAllView, page: CastSeeAllView),
    RouteDef(Routes.imagesSeeAllView, page: ImagesSeeAllView),
    RouteDef(Routes.videosSeeAllView, page: VideosSeeAllView),
    RouteDef(
      Routes.navBarView,
      page: NavBarView,
      generator: NavBarViewRouter(),
    ),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartUpView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const StartUpView(),
        settings: data,
      );
    },
    SearchView: (data) {
      var args = data.getArgs<SearchViewArguments>(
        orElse: () => SearchViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SearchView(key: args.key),
        settings: data,
      );
    },
    SearchResultsView: (data) {
      var args = data.getArgs<SearchResultsViewArguments>(
        orElse: () => SearchResultsViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => SearchResultsView(
          key: args.key,
          searchResults: args.searchResults,
          searchItem: args.searchItem,
        ),
        settings: data,
      );
    },
    MovieDetailsView: (data) {
      var args = data.getArgs<MovieDetailsViewArguments>(
        orElse: () => MovieDetailsViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => MovieDetailsView(
          key: args.key,
          model: args.model,
        ),
        settings: data,
      );
    },
    CastSeeAllView: (data) {
      var args = data.getArgs<CastSeeAllViewArguments>(
        orElse: () => CastSeeAllViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => CastSeeAllView(
          key: args.key,
          castAndCrewList: args.castAndCrewList,
        ),
        settings: data,
      );
    },
    ImagesSeeAllView: (data) {
      var args = data.getArgs<ImagesSeeAllViewArguments>(
        orElse: () => ImagesSeeAllViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => ImagesSeeAllView(
          key: args.key,
          imagesList: args.imagesList,
        ),
        settings: data,
      );
    },
    VideosSeeAllView: (data) {
      var args = data.getArgs<VideosSeeAllViewArguments>(
        orElse: () => VideosSeeAllViewArguments(),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => VideosSeeAllView(
          key: args.key,
          videosList: args.videosList,
        ),
        settings: data,
      );
    },
    NavBarView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const NavBarView(),
        settings: data,
      );
    },
  };
}

class NavBarViewRoutes {
  static const String movieReel = '/movie-reel';
  static const String eventsView = '/events-view';
  static const String notificationsView = '/notifications-view';
  static const String profileView = '/profile-view';
  static const all = <String>{
    movieReel,
    eventsView,
    notificationsView,
    profileView,
  };
}

class NavBarViewRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(NavBarViewRoutes.movieReel, page: MovieReel),
    RouteDef(NavBarViewRoutes.eventsView, page: EventsView),
    RouteDef(NavBarViewRoutes.notificationsView, page: NotificationsView),
    RouteDef(NavBarViewRoutes.profileView, page: ProfileView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    MovieReel: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const MovieReel(),
        settings: data,
      );
    },
    EventsView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const EventsView(),
        settings: data,
      );
    },
    NotificationsView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const NotificationsView(),
        settings: data,
      );
    },
    ProfileView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const ProfileView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// SearchView arguments holder class
class SearchViewArguments {
  final Key? key;
  SearchViewArguments({this.key});
}

/// SearchResultsView arguments holder class
class SearchResultsViewArguments {
  final Key? key;
  final List<AllMovies>? searchResults;
  final String? searchItem;
  SearchResultsViewArguments({this.key, this.searchResults, this.searchItem});
}

/// MovieDetailsView arguments holder class
class MovieDetailsViewArguments {
  final Key? key;
  final AllMovies? model;
  MovieDetailsViewArguments({this.key, this.model});
}

/// CastSeeAllView arguments holder class
class CastSeeAllViewArguments {
  final Key? key;
  final List<CastAndCrew>? castAndCrewList;
  CastSeeAllViewArguments({this.key, this.castAndCrewList});
}

/// ImagesSeeAllView arguments holder class
class ImagesSeeAllViewArguments {
  final Key? key;
  final List<Posters>? imagesList;
  ImagesSeeAllViewArguments({this.key, this.imagesList});
}

/// VideosSeeAllView arguments holder class
class VideosSeeAllViewArguments {
  final Key? key;
  final List<Videos>? videosList;
  VideosSeeAllViewArguments({this.key, this.videosList});
}
