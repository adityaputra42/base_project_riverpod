import 'dart:math';

import 'package:base_project/config/config.dart';
import 'package:base_project/utils/extension/datetime_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

@immutable
class AppUtils {
  const AppUtils._();

  static Random randomizer([int? seed]) => Random(seed);

  static Color getRandomColor([int? seed, List<Color>? colors]) {
    final rInt = seed != null ? (seed + DateTime.now().minute) : null;
    final color = colors ?? [AppColor.primaryColor];
    return color[randomizer(rInt).nextInt(color.length)];
  }

  static bool boolFromInt(int i) => i == 1;
  static int boolToInt(bool b) => b ? 1 : 0;
  static String dateToJson(DateTime date) {
    return date.toDateString('yyyy-MM-dd');
  }

  static String dateTimeToJson(DateTime date) {
    return date.toDateString('yyyy-MM-dd HH:mm:ss');
  }

  static TimeOfDay timeFromJson(String time) {
    final dateTime = DateFormat.Hms().parse(time);
    return TimeOfDay.fromDateTime(dateTime);
  }

  static T? toNull<T>(Object? _) => null;

  static List<int>? removeNulls(List? list) {
    return list?.whereType<int>().toList();
  }

  // /// Helper method to show toast message
  // static void showFlushBar({
  //   required BuildContext context,
  //   required String message,
  //   IconData? icon = Icons.error_rounded,
  //   double? iconSize = 28,
  //   Color? iconColor = Colors.redAccent,
  // }) {
  //   Flushbar<void>(
  //     message: message,
  //     messageSize: 15,
  //     messageColor: AppColors.textWhite80Color,
  //     borderRadius: Corners.rounded9,
  //     margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //     padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
  //     backgroundColor: const Color.fromARGB(218, 48, 48, 48),
  //     boxShadows: Shadows.universal,
  //     icon: Icon(
  //       icon,
  //       size: iconSize,
  //       color: iconColor,
  //     ),
  //     shouldIconPulse: false,
  //     dismissDirection: FlushbarDismissDirection.HORIZONTAL,
  //     duration: const Duration(seconds: 3),
  //   ).show(context);
  // }
}

/// A utility class that holds commonly used regular expressions
/// employed throughout the entire app.
/// This class has no constructor and all variables are `static`.
@immutable
class Regexes {
  const Regexes._();

  static RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\.]+\.(com|pk)+",
  );

  static RegExp contactRegex = RegExp(r'^(03|3)\d{9}$');

  static RegExp erpRegex = RegExp(r'^[1-9]{1}\d{4}$');

  static RegExp nameRegex = RegExp(r'^[a-z A-Z]+$');

  static RegExp zipCodeRegex = RegExp(r'^\d{5}$');

  static RegExp creditCardNumberRegex =
      RegExp(r'^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14})$');

  static RegExp creditCardCVVRegex = RegExp(r'^[0-9]{3}$');
  static RegExp creditCardExpiryRegex =
      RegExp(r'(0[1-9]|10|11|12)/20[0-9]{2}$');

  static final RegExp otpDigitRegex = RegExp(r'^[0-9]{1}$');
}

@immutable
class Durations {
  const Durations._();
  static const fastest = Duration(milliseconds: 150);
  static const fast = Duration(milliseconds: 250);
  static const normal = Duration(milliseconds: 300);
  static const medium = Duration(milliseconds: 500);
  static const slow = Duration(milliseconds: 700);
  static const slower = Duration(milliseconds: 1000);
}
