extension StringExtension on String {
  String? get appendZeroPrefix {
    return length <= 1 ? "0$this" : this;
  }
}
