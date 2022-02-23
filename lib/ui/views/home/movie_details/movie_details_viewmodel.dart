import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../models/genres/genre_model.dart';
import '../../../../services/local_storage/local_storage.dart';
import '../../../../utils/export_utils.dart';

class MovieDetailsViewModel extends BaseViewModel {
  final log = getLogger('MovieDetailsViewModel ');
  final _localStorage = locator<ILocalStorage>();
  final _navigationService = locator<NavigationService>();

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

  void goBack() {
    _navigationService.back();
  }
}
