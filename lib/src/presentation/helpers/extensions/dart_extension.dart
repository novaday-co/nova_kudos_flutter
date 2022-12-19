extension CheckType on Object {
  T? isA<T>() {
    if (this is T) {
      return this as T;
    }
    return null;
  }
}