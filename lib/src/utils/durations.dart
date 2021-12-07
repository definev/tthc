class Durations {
  static const int kFast = 200;
  static const int kMedium = 400;
  static const int kSlow = 750;
  static const int kSlowest = 1000;
}

extension DurationExt on int {
  Duration get duration => Duration(milliseconds: this);
}
