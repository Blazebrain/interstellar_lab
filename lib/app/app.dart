import 'package:interstellar_labs/services/api/api.dart';
import 'package:interstellar_labs/services/api/api_service.dart';
import 'package:interstellar_labs/services/local_storage/local_storage.dart';
import 'package:interstellar_labs/services/local_storage/local_storage_service.dart';
import 'package:interstellar_labs/services/movies/movies.dart';
import 'package:interstellar_labs/services/movies/movies_service.dart';
import 'package:interstellar_labs/ui/views/home/movie_details/movie_details_view.dart';
import 'package:interstellar_labs/ui/views/home/movie_details/tabs/details/widgets/see_all_pages/cast_see_all.dart';
import 'package:interstellar_labs/ui/views/home/movie_details/tabs/details/widgets/see_all_pages/images_see_all_view.dart';
import 'package:interstellar_labs/ui/views/home/movie_details/tabs/details/widgets/see_all_pages/videos_see_all.dart';
import 'package:interstellar_labs/ui/views/home/nav_bar/nav_bar_view.dart';
import 'package:interstellar_labs/ui/views/home/nav_bar_pages/events/events_view.dart';
import 'package:interstellar_labs/ui/views/home/nav_bar_pages/movie_reel/movie_reel_view.dart';
import 'package:interstellar_labs/ui/views/home/nav_bar_pages/notification/notification_view.dart';
import 'package:interstellar_labs/ui/views/home/nav_bar_pages/profile/profile_view.dart';
import 'package:interstellar_labs/ui/views/home/search/search_view.dart';
import 'package:interstellar_labs/ui/views/home/search_results/search_result_view.dart';
import 'package:interstellar_labs/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: StartUpView),
    AdaptiveRoute(page: SearchView),
    AdaptiveRoute(page: SearchResultsView),
    AdaptiveRoute(page: MovieDetailsView),
    AdaptiveRoute(page: CastSeeAllView),
    AdaptiveRoute(page: ImagesSeeAllView),
    AdaptiveRoute(page: VideosSeeAllView),
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
