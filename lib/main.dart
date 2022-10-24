import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_management_app/provider/date_field_provider.dart';
import 'package:task_management_app/provider/reminder_provider.dart';
import 'package:task_management_app/provider/theme_provider.dart';
import 'package:task_management_app/provider/time_fileld_provider.dart';
import 'package:task_management_app/services/theme_services.dart';
import 'package:task_management_app/theme.dart';
import 'package:task_management_app/ui/home.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => StreamTheme()),
    ChangeNotifierProvider(create: (_) => DateFieldProvider()),
    ChangeNotifierProvider(create: (_) => TimeFieldProvider()),
    ChangeNotifierProvider(create: (_) => ReminderProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Task App',
      debugShowCheckedModeBanner: false,
      theme: Themes.lightMode,
      darkTheme: Themes.darkMode,
      themeMode: ThemeServices.theme,
      home: const HomePage(),
    );
  }
}
