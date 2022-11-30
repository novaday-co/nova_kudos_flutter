import 'package:shamsi_date/shamsi_date.dart';

extension DateTimeExtension on DateTime {
  String get formattedJalaliDate {
    Jalali jalaliDate = toJalali();
    return '${jalaliDate.year}/${jalaliDate.month}/${jalaliDate.day}';
  }
}
