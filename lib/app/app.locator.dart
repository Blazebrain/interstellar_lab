// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/api/api.dart';
import '../services/api/api_service.dart';
import '../services/local_storage/local_storage.dart';
import '../services/local_storage/local_storage_service.dart';
import '../services/movies/movies.dart';
import '../services/movies/movies_service.dart';

final locator = StackedLocator.instance;

Future setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton<IApi>(() => ApiService());
  final localStorageService = await LocalStorageService.getInstance();
  locator.registerSingleton<ILocalStorage>(localStorageService);

  locator.registerLazySingleton<IMovies>(() => MoviesService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SnackbarService());
}
