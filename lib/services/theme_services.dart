import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

class ThemeServices extends GetxController {
  static final _box = GetStorage();
  static const _key = "isDarkMode";
  static _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  static bool _loadThemeFromBox() => _box.read(_key) ?? false;
  static ThemeMode get theme =>
      _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }
}
