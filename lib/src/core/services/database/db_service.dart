import 'package:ecommerce_flutter/src/core/services/database/db_interface.dart';

class DbService<T> implements DbInterface<T> {
  DbService() {
    _init();
  }

  Future<void> _init() async {
    // await Isar.in();
  }

  @override
  Future<void> delete(String boxName, dynamic key) async {
    final box = _getBox(boxName);
    await box.delete(key);
  }

  @override
  List<T> getAll(String boxName) {
    final box = _getBox(boxName);
    final items = box.values.toList();
    return items.cast<T>();
  }

  @override
  Future<void> insert(String boxName, T item) async {
    final box = _getBox(boxName);
    await box.add(item);
  }

  @override
  void update(String boxName, dynamic key, T item) {
    final box = _getBox(boxName);
    box.put(key, item);
  }

  dynamic _getBox(String boxName) {
    return [];
  }
}
