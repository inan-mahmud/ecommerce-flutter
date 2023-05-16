abstract interface class CacheInterface<T> {
  Future<bool> save({required String key, T? value});
  T? read({required String key});
  Future<bool> delete({required String key});
  bool containsKey({required String key});
}
