import 'package:flutter/material.dart';

extension DateTimeExtension on DateTime {
  int get weekOfMonth {
    var date = this;
    final firstDayOfTheMonth = DateTime(date.year, date.month, 1);
    int sum = firstDayOfTheMonth.weekday - 1 + date.day;
    if (sum % 7 == 0) {
      return sum ~/ 7;
    } else {
      return sum ~/ 7 + 1;
    }
  }

  bool isAfterOrEqualTo(DateTime dateTime) {
    final date = this;
    bool isAtSameMomentAs = dateTime.isAtSameMomentAs(date);
    return isAtSameMomentAs || date.isAfter(dateTime);
  }

  bool isBeforeOrEqualTo(DateTime dateTime) {
    final date = this;
    bool isAtSameMomentAs = dateTime.isAtSameMomentAs(date);
    return isAtSameMomentAs || date.isBefore(dateTime);
  }

  bool isBetween(DateTime fromDateTime, DateTime toDateTime) {
    final date = this;
    bool isAfter = date.isAfterOrEqualTo(fromDateTime);
    bool isBefore = date.isBeforeOrEqualTo(toDateTime);
    return isAfter && isBefore;
  }
}

extension StringExtension on String {
  String get inCaps =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';

  String get capitalizeFirstofEach => replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.inCaps)
      .join(" ");

  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

// extension MQExtension on BuildContext {
//   double get height => MediaQuery.of(this).size.height;
//   double get width => MediaQuery.of(this).size.width;
// }

extension OnInt on int {
  SizedBox get vertical => SizedBox(height: toDouble());
  SizedBox get horizontal => SizedBox(width: toDouble());
}
