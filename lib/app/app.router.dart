// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/views/home/nav_bar/nav_bar_view.dart';
import '../ui/views/home/nav_bar_pages/events/events_view.dart';
import '../ui/views/home/nav_bar_pages/movie_reel/movie_reel_view.dart';
import '../ui/views/home/nav_bar_pages/notification/notification_view.dart';
import '../ui/views/home/nav_bar_pages/profile/profile_view.dart';
import '../ui/views/startup/startup_view.dart';

class Routes {
  static const String startUpView = '/start-up-view';
  static const String navBarView = '/nav-bar-view';
  static const all = <String>{
    startUpView,
    navBarView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
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
