import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String formatDateTime(String format) {
    return DateFormat(format).format(this);
  }
}

extension StringX on String {
  DateTime parseDateTime(String parser) {
    return DateFormat(parser).parse(this);
  }
}
