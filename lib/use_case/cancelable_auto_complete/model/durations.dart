enum Durations {
  low(Duration(microseconds: 500)),
  normal(Duration(seconds: 1)),
  ;

  final Duration value;
  const Durations(this.value);
}
