enum ScreenSize {
  small(800),
  big(double.infinity);

  final double maxWidth;
  const ScreenSize(this.maxWidth);

  bool get isBig => this == ScreenSize.big;
  bool get isSmall => this == ScreenSize.small;
}
