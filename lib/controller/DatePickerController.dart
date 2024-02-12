import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerController {
  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime.now());
  DateTime selectedDate = DateTime.now();
  String formattedDate =
      DateFormat('dd-MM-yyyy').format(DateTime.now()); // Formatted date

  selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      formattedDate = DateFormat('dd-MM-yyyy')
          .format(selectedDate); // Update formatted date
    }

    Route<DateTime> _datePickerRoute(
      BuildContext context,
      Object? arguments,
    ) {
      return DialogRoute<DateTime>(
        context: context,
        builder: (BuildContext context) {
          return DatePickerDialog(
            restorationId: 'date_picker_dialog',
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            initialDate: _selectedDate.value,
            firstDate: DateTime(1950),
            lastDate: DateTime(2101),
          );
        },
      );
    }

    // Include other necessary methods and logic here
  }
}
