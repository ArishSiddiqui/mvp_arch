import 'dart:convert';
import 'dart:developer';

class CustomLogger {
  static p(
    Object? m, {
    String? message,
  }) {
    if (message != null) {
      log('$message : ${jsonEncode(m)}');
    } else {
      log(jsonEncode(m));
    }
  }

  static pP(
    Object? m, {
    String? message,
  }) {
    if (message != null) {
      log('$message : ${const JsonEncoder.withIndent('  ').convert(m)}');
    } else {
      log(const JsonEncoder.withIndent('  ').convert(m));
    }
  }
}
