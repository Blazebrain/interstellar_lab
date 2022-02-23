import 'dart:developer';

import 'package:interstellar_labs/app/app.locator.dart';
import 'package:interstellar_labs/app/app.logger.dart';
import 'package:interstellar_labs/models/genres/genre_model.dart';
import 'package:interstellar_labs/services/local_storage/local_storage.dart';
import 'package:interstellar_labs/utils/constants/storage_keys.dart';
import 'package:interstellar_labs/utils/export_utils.dart';
import 'package:stacked/stacked.dart';

class MovieDetailsViewModel extends BaseViewModel {
  final log = getLogger('MovieDetailsViewModel ');
  final _localStorage = locator<ILocalStorage>();
  List<Genres> _genresList = [];
  List<String> genreNames = [];

  Future<void> setUp(genreIds) async {
    await runBusyFuture(runTask(genreIds));
  }

  runTask(genreIds) async {
    final value = await _localStorage.get(StorageKeys.genreBox,
        key: HiveTypeIdKeys.genreTypeIdKey);
    _genresList.addAll(value);
    getGenreName(genreIds);
    notifyListeners();
  }

  List<String> getGenreName(List<int> genreIds) {
    for (var genreId in genreIds) {
      final item =
          _genresList.where((element) => element.id == genreId).toList();
      genreNames.add(item.first.name!);
    }

    return genreNames;
  }
}
