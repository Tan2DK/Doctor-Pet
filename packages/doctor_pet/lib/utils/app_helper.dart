import 'package:doctor_pet/utils/app_enum.dart';

class AppHelper {
  AppHelper._();
  static String getAbbrWeekDay(int weekday) {
    return Weekday.values[weekday - 1].getAbbr;
  }

  static String formatMonthNumber(int month){
    return switch (month) {
      1 => '${month}st',
      2 => '${month}nd',
      3 => '${month}rd',
      _ => '${month}th',
    };
  }
}
