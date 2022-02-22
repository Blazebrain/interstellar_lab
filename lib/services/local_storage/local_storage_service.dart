import 'package:hive/hive.dart';
import 'package:interstellar_labs/app/app.logger.dart';
import 'package:interstellar_labs/models/all_movies/all_movies.dart';
import 'package:interstellar_labs/services/local_storage/local_storage.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class LocalStorageService implements ILocalStorage {
  static final log = getLogger('LocalStorageService');

  static LocalStorageService? _instance;

  static Future<LocalStorageService> getInstance() async {
    _instance ??= LocalStorageService();
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    _setupAllHiveTypeAdapters();
    log.i('Local storage service initialized');
    return _instance!;
  }

  /// Register Hive adapters here
  static void _setupAllHiveTypeAdapters() {
    Hive.registerAdapter(AllMoviesAdapter());
  }

  @override
  Future<int?> add(String boxIdentifier, {required value}) async {
    Box? box;
    try {
      box = await Hive.openBox(boxIdentifier);
    } catch (e) {
      log.e(e);
    }
    return await box?.add(value);
  }

  @override
  Future<void> delete(String boxIdentifier, {key}) async {
    try {
      final box = await Hive.openBox(boxIdentifier);
      await box.delete(key);
    } catch (e) {
      log.e(e);
    }
  }

  @override
  Future<int?> addToLazyBox(String boxIdentifier, {required value}) async {
    LazyBox? lazyBox;
    try {
      lazyBox = await Hive.openLazyBox(boxIdentifier);
    } catch (e) {
      log.e(e);
    }
    return await lazyBox?.add(value);
  }

  @override
  Future<dynamic> get(String boxIdentifier, {key}) async {
    Box? box;
    try {
      box = await Hive.openBox(boxIdentifier);
    } catch (e) {
      log.e(e);
    }
    return box?.get(key);
  }

  @override
  Future<void> put(String boxIdentifier, {key, value}) async {
    try {
      final box = await Hive.openBox(boxIdentifier);
      await box.put(key, value);
    } catch (e) {
      log.e(e);
    }
  }

  @override
  Future<int?> clear(Box box) async {
    int? value;
    try {
      value = await box.clear();
    } catch (e) {
      log.e(e);
    }
    return value;
  }

  @override
  Future<void> close(Box box) async {
    try {
      await box.close();
    } catch (e) {
      log.e(e);
    }
  }

  @override
  Future<void> compact(Box box) async {
    try {
      await box.compact();
    } catch (e) {
      log.e(e);
    }
  }

  @override
  Future<bool?> containsKey(String boxIdentifier, {key}) async {
    Box? box;
    try {
      box = await Hive.openBox(boxIdentifier);
    } catch (e) {
      log.e(e);
    }
    return box?.containsKey(key);
  }

  @override
  Future<void> deleteAll(String boxIdentifier,
      {required Iterable<dynamic> keys}) async {
    try {
      final box = await Hive.openBox(boxIdentifier);
      await box.deleteAll(keys);
    } catch (e) {
      log.e(e);
    }
  }

  @override
  Future<void> deleteAt(String boxIdentifier, {required int index}) async {
    try {
      final box = await Hive.openBox(boxIdentifier);
      await box.deleteAt(index);
    } catch (e) {
      log.e(e);
    }
  }

  @override
  Future<void> deleteFromDisk(String boxIdentifier) async {
    try {
      final box = await Hive.openBox(boxIdentifier);
      await box.deleteFromDisk();
    } catch (e) {
      log.e(e);
    }
  }

  @override
  Future<dynamic> getAt(String boxIdentifier, {required int index}) async {
    Box? box;
    try {
      box = await Hive.openBox(boxIdentifier);
    } catch (e) {
      log.e(e);
    }
    return box?.getAt(index);
  }

  @override
  Future<dynamic> keyAt(String boxIdentifier, {required int index}) async {
    Box? box;
    try {
      box = await Hive.openBox(boxIdentifier);
    } catch (e) {
      log.e(e);
    }
    return box?.keyAt(index);
  }

  @override
  Future<void> putAll(String boxIdentifier,
      {required Map<dynamic, dynamic> entries}) async {
    Box? box;
    try {
      box = await Hive.openBox(boxIdentifier);
      await box.putAll(entries);
    } catch (e) {
      log.e(e);
    }
  }

  @override
  Future<void> putAt(String boxIdentifier,
      {required int index, required value}) async {
    try {
      final box = await Hive.openBox(boxIdentifier);
      await box.putAt(index, value);
    } catch (e) {
      log.e(e);
    }
  }

  @override
  Future<Iterable?> valuesBetween(String boxIdentifier,
      {startKey, endKey}) async {
    Box? box;
    try {
      box = await Hive.openBox(boxIdentifier);
    } catch (e) {
      log.e(e);
    }
    return box?.valuesBetween();
  }

  @override
  Future<Stream<BoxEvent>?> watch(String boxIdentifier, {required key}) async {
    Box? box;
    try {
      box = await Hive.openBox(boxIdentifier);
    } catch (e) {
      log.e(e);
    }
    return box?.watch(key: key);
  }

  @override
  Future<Iterable<int>?> addAll(String boxIdentifier,
      {required Iterable<dynamic> values}) async {
    Box? box;
    try {
      box = await Hive.openBox(boxIdentifier);
    } catch (e) {
      log.e(e);
    }
    return await box?.addAll(values);
  }
}
