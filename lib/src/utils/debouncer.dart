import 'dart:async';

const _defaultBounceDuration = Duration(seconds: 1);

final class Debouncer<Value> {
  Debouncer({
    required this.action,
    this.bounceWaitDuration = _defaultBounceDuration,
  });

  final Duration bounceWaitDuration;

  final FutureOr<dynamic> Function(List<Value> values) action;

  final _values = <Value>[];

  Timer? _timer;

  Future<void> _onBounce() async {
    await action.call(_values);

    _timer?.cancel();
    _timer = null;
  }

  void addAll(List<Value> values) {
    _values.addAll(values);

    _bounce();
  }

  void add(Value value) {
    _values.add(value);

    _bounce();
  }

  void replaceAll(Value value) {
    _values
      ..clear()
      ..add(value);

    _bounce();
  }

  void _bounce() {
    _timer?.cancel();
    _timer = Timer(bounceWaitDuration, _onBounce);
  }

  void dispose() {
    _timer?.cancel();
  }
}
