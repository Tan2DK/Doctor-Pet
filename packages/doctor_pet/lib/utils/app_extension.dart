import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String formatDateTime(String format) {
    return DateFormat(format).format(this);
  }
}
