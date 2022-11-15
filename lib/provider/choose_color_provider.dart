import 'package:flutter/foundation.dart';

class ChooseColorProvider extends ChangeNotifier {
  int _selectedColor = 0;

  int get selectedColor => _selectedColor;

  void selectColor(int index) {
    _selectedColor = index;
    notifyListeners();
  }
}
