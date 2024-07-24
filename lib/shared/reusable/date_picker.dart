import 'package:flutter/material.dart';

class DatePickerUtil {
  static Future<DateTime?> selectDate(BuildContext context,
      {DateTime? initialDate}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    return picked;
  }
}
