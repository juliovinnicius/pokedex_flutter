Map<T, List<S>> groupBy<S, T>(Iterable<S> values, T Function(S) key) {
  final map = <T, List<S>>{};
  for (final element in values) {
    (map[key(element)] ??= []).add(element);
  }
  return map;
}
