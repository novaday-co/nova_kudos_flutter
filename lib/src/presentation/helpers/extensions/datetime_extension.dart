import 'package:flutter/cupertino.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/string_extension.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:sprintf/sprintf.dart';

extension DateTimeExtension on DateTime {
  String get formattedJalaliDate {
    Jalali jalaliDate = toJalali();
    return '${jalaliDate.year}/${jalaliDate.month}/${jalaliDate.day}';
  }

  String get formattedJalaliDateWithTime {
    Jalali jalaliDate = toJalali();
    return '${jalaliDate.hour.toString().appendZeroPrefix}:${jalaliDate.minute.toString().appendZeroPrefix} - ${jalaliDate.year}/${jalaliDate.month}/${jalaliDate.day}';
  }

  String differenceFromNow(BuildContext context) {
    int inDaysDifference = difference(DateTime.now()).inDays;
    return sprintf(context.getStrings.phDay, [inDaysDifference]);
  }
}
