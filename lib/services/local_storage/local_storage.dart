import 'package:hive/hive.dart';

abstract class ILocalStorage {
  /// Create
  Future<int?> add(String boxIdentifier, {required dynamic value});

  Future<Iterable<int>?> addAll(String boxIdentifier,
      {required Iterable values});

  Future<int?> addToLazyBox(String boxIdentifier, {required value});

  /// Read
  Future<dynamic> get(String boxIdentifier, {required dynamic key});

  Future<dynamic> getAt(String boxIdentifier, {required int index});

  /// Update
  Future<void> put(String boxIdentifier,
      {required dynamic key, required dynamic value});

  Future<void> putAll(String boxIdentifier, {required Map entries});

  Future<void> putAt(String boxIdentifier,
      {required int index, required dynamic value});

  /// Delete
  Future<void> delete(String boxIdentifier, {required dynamic key});

  Future<void> deleteAt(String boxIdentifier, {required int index});

  Future<void> deleteAll(String boxIdentifier, {required Iterable keys});

  Future<void> deleteFromDisk(String boxIdentifier);

  /// Extra
  Future<void> close(Box box);

  Future<int?> clear(Box box);

  Future<void> compact(Box box);

  Future<bool?> containsKey(String boxIdentifier, {required dynamic key});

  Future<dynamic> keyAt(String boxIdentifier, {required int index});

  Future<Iterable?> valuesBetween(String boxIdentifier,
      {required dynamic startKey, required dynamic endKey});

  Future<Stream<BoxEvent>?> watch(String boxIdentifier, {required dynamic key});
}
