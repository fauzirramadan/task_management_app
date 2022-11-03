import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/components/myappbar.dart';
import 'package:task_management_app/components/mybutton.dart';
import 'package:task_management_app/provider/theme_provider.dart';
import 'package:task_management_app/services/notification_services.dart';
import 'package:task_management_app/services/theme_services.dart';
import 'package:task_management_app/theme.dart';
import 'package:task_management_app/ui/add_task_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NotificationHelper _notificationHelper = NotificationHelper();
  String dateNow = DateFormat.yMMMMd().format(DateTime.now());
  DateTime _selectedDate = DateTime.now();
  final DatePickerController _datePickerController = DatePickerController();
  @override
  void initState() {
    _notificationHelper;
    _notificationHelper.initializeNotification();
    _notificationHelper.requestIOSPermissions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ThemeServices());
    bool isDarkMode = context.watch<StreamTheme>().isDarkMode;
    var themeProvider = context.read<StreamTheme>();

    return Scaffold(
      appBar: myAppBar(
        () {
          controller.switchTheme();
          _notificationHelper.displayNotification(
              title: "Theme changed",
              body: Get.isDarkMode
                  ? "Activate Light mode"
                  : "Activate Dark mode");
          themeProvider.switchTheme();
        },
        Icon(
          isDarkMode ? Icons.wb_sunny_outlined : Icons.mode_night_outlined,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      body: Column(
        children: [
          _addTaskBar(isDarkMode),
          _dateBar(isDarkMode),
        ],
      ),
    );
  }

  Widget _dateBar(bool isDarkMode) {
    return Container(
        padding: const EdgeInsets.only(left: 3),
        child: DatePicker(
          DateTime.now(),
          height: 80,
          width: 60,
          selectionColor: isDarkMode ? Colors.blueGrey : primaryColor,
          controller: _datePickerController,
          daysCount: 7,
          initialSelectedDate: _selectedDate,
          onDateChange: (date) {
            setState(() {
              _selectedDate = date;
            });
          },
        ));
  }

  Widget _addTaskBar(bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(dateNow, style: headingStyle),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Today",
                style: subHeadingStyle,
              )
            ],
          ),
          MyuButton(
            onTap: () => Get.to(() => AddTaskForm()),
            label: "Add Task",
            buttonColor: isDarkMode ? Colors.blueGrey : primaryColor,
          )
        ],
      ),
    );
  }
}
