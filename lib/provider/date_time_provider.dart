import 'package:flutter/material.dart';

class DateTimeProvider extends ChangeNotifier {
  DateTime initialDate = DateUtils.dateOnly(DateTime.now());
  TimeOfDay initialTime = TimeOfDay.now();

  // TimeOfDay time = TimeOfDay.now();
  DateTime date = DateUtils.dateOnly(DateTime.now());

  void onDateTapped(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: Theme.of(context).primaryColor,
                surface: Theme.of(context).colorScheme.surface,
                onPrimary: Theme.of(context).colorScheme.onSurface,
                onSurface: Theme.of(context).colorScheme.onSurface),
          ),
          child: child!),
      context: context,
      initialDate: date ?? initialDate,
      firstDate: initialDate,
      lastDate: initialDate.add(
        Duration(days: 365),
      ),
    );
    if (selectedDate != null &&
        (selectedDate.isAfter(initialDate) ||
            selectedDate.isAtSameMomentAs(initialDate))) {
      date = DateUtils.dateOnly(selectedDate);
    }
    notifyListeners();
  }

  void onTimeTapped(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: Theme.of(context).primaryColor,
                surface: Theme.of(context).colorScheme.surface,
                onPrimary: Theme.of(context).colorScheme.onSurface,
                onSurface: Theme.of(context).colorScheme.onSurface),
          ),
          child: child!),
      context: context,
      initialTime: initialTime,
    );
    if (selectedTime != null) {
      initialTime = selectedTime;
    }

    notifyListeners();
  }
}
