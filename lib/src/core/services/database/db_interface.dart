abstract interface class DbInterface<T> {
  Future<void> insert(String boxName, T item);
  void update(String boxName, dynamic key, T item);
  Future<void> delete(String boxName, dynamic key);
  List<T> getAll(String boxName);
}
