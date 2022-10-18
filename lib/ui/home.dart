import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:task_management_app/services/notification_services.dart';
import 'package:task_management_app/services/theme_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NotificationHelper _notificationHelper = NotificationHelper();
  @override
  void initState() {
    _notificationHelper;
    _notificationHelper.initializeNotification();
    _notificationHelper.requestIOSPermissions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              ThemeServices.switchTheme();
              _notificationHelper.displayNotification(
                  title: "Theme changed",
                  body: Get.isDarkMode
                      ? "Activate Light mode"
                      : "Activate Dark mode");
            },
            icon: const Icon(Icons.mode_night_rounded)),
      ),
    );
  }
}
