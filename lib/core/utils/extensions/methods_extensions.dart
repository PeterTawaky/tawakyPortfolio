extension FutureMethods<T> on Future<T> {
  Future<T> trackTime(String name) async {
    final start = DateTime.now();
    final result = await this;
    final end = DateTime.now();
    print('$name took ${end.difference(start).inMilliseconds} ms');
    return result;
  }
}

extension FunctionTimer on Function {
  T trackTime<T>(String name) {
    final start = DateTime.now();
    final result = this(); // call the function
    final end = DateTime.now();
    print('$name took ${end.difference(start).inMilliseconds} ms');
    return result;
  }
}
