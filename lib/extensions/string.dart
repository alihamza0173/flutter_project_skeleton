extension XString on String {
  String? toNullIfEmpty() {
    if (isEmpty) {
      return null;
    }
    return this;
  }
}
