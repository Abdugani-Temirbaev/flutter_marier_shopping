extension StringExtension on String {
  get firstLetterToUpperCase {
    if (this != null)
      return this[0].toUpperCase() + this.substring(1);
    else
      return null;
  }

  getFromAssets() {
    if (this.contains('svg') || this.contains('png') || this.contains('jpeg') || this.contains('jpg'))
      return 'assets/images/' + this;
    else
      return '';
  }
}

extension KotlinExt<T> on T {
  A let<A>(A Function(T) f) => f(this);
  T also(void Function(T) f) {
    f(this);
    return this;
  }
}
