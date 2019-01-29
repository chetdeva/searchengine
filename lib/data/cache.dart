import 'dart:async';
import 'dart:collection';

abstract class Cache<T> {
  put(String key, T object);

  bool contains(String key);

  Future<T> get(String key);

  void clear();
}

class MemCache<T> extends Cache<T> {
  final map = HashMap<String, T>();

  @override
  put(String key, object) {
    map[key] = object;
  }

  @override
  bool contains(String key) {
    return map.containsKey(key);
  }

  @override
  Future<T> get(String key) {
    return Future.value(map[key]);
  }

  @override
  void clear() {
    map.clear();
  }

}
