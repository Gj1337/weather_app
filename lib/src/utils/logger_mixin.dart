// ignore_for_file: avoid_print, unused_field

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

enum _Colors {
  black('\x1B[30m'),
  red('\x1B[31m'),
  green('\x1B[32m'),
  yellow('\x1B[33m'),
  blue('\x1B[34m'),
  magent('\x1B[35m'),
  cyan('\x1B[36m'),
  white('\x1B[37m'),
  reset('\x1B[0m');

  final String ansiCode;
  const _Colors(this.ansiCode);
}

mixin LoggerMixin<T> on Object {
  late final logger = Logger(printer: _MyPrinter(runtimeType.toString()));
}

class _MyPrinter extends LogPrinter {
  _MyPrinter(this.printerName);

  final String printerName;

  @override
  List<String> log(LogEvent event) {
    final isImportant = event.level.value > 3000;

    final message = isImportant
        ? '${_Colors.red.ansiCode}${event.message.toString()}${_Colors.reset.ansiCode}'
        : event.message.toString();

    final text = (kDebugMode || isImportant)
        ? ['➡ $printerName', message, '\r\n']
        : <String>[];

    return text;
  }
}
