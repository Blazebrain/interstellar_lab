import 'package:interstellar_labs/services/api/api.dart';
import 'package:interstellar_labs/services/api/api_service.dart';
import 'package:interstellar_labs/services/local_storage/local_storage.dart';
import 'package:interstellar_labs/services/local_storage/local_storage_service.dart';
import 'package:interstellar_labs/services/movies/movies.dart';
import 'package:interstellar_labs/services/movies/movies_service.dart';
import 'package:interstellar_labs/ui/views/home/nav_bar/nav_bar_view.dart';
import 'package:interstellar_labs/ui/views/home/nav_bar_pages/events/events_view.dart';
import 'package:interstellar_labs/ui/views/home/nav_bar_pages/movie_reel/movie_reel_view.dart';
import 'package:interstellar_labs/ui/views/home/nav_bar_pages/notification/notification_view.dart';
import 'package:interstellar_labs/ui/views/home/nav_bar_pages/profile/profile_view.dart';
import 'package:interstellar_labs/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: StartUpView),
    AdaptiveRoute(
      page: NavBarView,
      children: [
        AdaptiveRoute(page: MovieReel),
        AdaptiveRoute(page: EventsView),
        AdaptiveRoute(page: NotificationsView),
        AdaptiveRoute(page: ProfileView),
      ],
    ),
  ],
  dependencies: [
    LazySingleton(classType: ApiService, asType: IApi),
    Presolve(
        classType: LocalStorageService,
        presolveUsing: LocalStorageService.getInstance,
        asType: ILocalStorage),
    LazySingleton(classType: MoviesService, asType: IMovies),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
  ],
  logger: StackedLogger(),
)
class AppSetup {}
