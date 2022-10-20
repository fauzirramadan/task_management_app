import 'package:flutter/foundation.dart';

class StreamTheme with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void switchTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
