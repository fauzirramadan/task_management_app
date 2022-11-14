import 'dart:developer';

import 'package:flutter/foundation.dart';

class ReminderProvider with ChangeNotifier {
  int _selectedValue = 0;

  int get selectedValue => _selectedValue;

  void Function(int?)? selectReminder(int newValue) {
    _selectedValue = newValue;
    log(newValue.toString());
    notifyListeners();
    return null;
  }
}
