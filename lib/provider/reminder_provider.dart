import 'package:flutter/foundation.dart';

class ReminderProvider with ChangeNotifier {
  String _selectedValue = "";

  String get selectedValue => _selectedValue;

  void Function(String?)? selectReminder(String newValue) {
    _selectedValue = newValue;
    notifyListeners();
    return null;
  }
}
