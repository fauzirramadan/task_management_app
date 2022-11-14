import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/components/custom_field.dart';
import 'package:task_management_app/components/dropdown_field.dart';
import 'package:task_management_app/components/myappbar.dart';
import 'package:task_management_app/provider/date_field_provider.dart';
import 'package:task_management_app/provider/reminder_provider.dart';
import 'package:task_management_app/provider/time_fileld_provider.dart';
import 'package:task_management_app/theme.dart';

import '../provider/theme_provider.dart';

class AddTaskForm extends StatelessWidget {
  AddTaskForm({super.key});

  final TextEditingController titleC = TextEditingController();
  final TextEditingController noteC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = context.watch<StreamTheme>().isDarkMode;
    TextEditingController dateInput =
        context.watch<DateFieldProvider>().dateInput;
    var dateProvider = context.read<DateFieldProvider>();

    TextEditingController startTimeInput =
        context.watch<TimeFieldProvider>().startTimeInput;
    TextEditingController endTimeInput =
        context.watch<TimeFieldProvider>().endTimeInput;
    var timeProvider = context.read<TimeFieldProvider>();

    int selectedValue = context.watch<ReminderProvider>().selectedValue;
    var reminderProvider = context.read<ReminderProvider>();

    return Scaffold(
      appBar: myAppBar(
        () => Get.back(),
        Icon(
          Icons.arrow_back_ios_new_rounded,
          color: isDarkMode ? white : Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 12, right: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Title",
                style: subHeadingStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              _customTextField(titleC),
              Text(
                "Note",
                style: subHeadingStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              _customTextField(noteC),
              Text(
                "Date",
                style: subHeadingStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              CustomField(
                icon: Icons.calendar_month_rounded,
                dateController: dateInput,
                onTap: () => dateProvider.chooseDate(context),
                hintText: "Choose Date",
              ),
              const SizedBox(
                height: 5,
              ),
              _timeRow(
                  startTimeInput: startTimeInput,
                  timeProvider: timeProvider,
                  context: context,
                  endTimeInput: endTimeInput),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Remind",
                style: subHeadingStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              DropDownField(
                  value: selectedValue,
                  onChange: (newValue) {
                    reminderProvider.selectReminder(newValue ?? 0);
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget _timeRow(
      {required TextEditingController startTimeInput,
      required TimeFieldProvider timeProvider,
      required BuildContext context,
      required TextEditingController endTimeInput}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Start Time",
                style: subHeadingStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              CustomField(
                  icon: Icons.access_time,
                  dateController: startTimeInput,
                  onTap: () => timeProvider.chooseTime(
                      context: context, isStartTime: true),
                  hintText: "Start time")
            ],
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "End Time",
                style: subHeadingStyle,
              ),
              const SizedBox(
                height: 5,
              ),
              CustomField(
                  icon: Icons.av_timer_rounded,
                  dateController: endTimeInput,
                  onTap: () => timeProvider.chooseTime(
                      context: context, isStartTime: false),
                  hintText: "End time")
            ],
          ),
        )
      ],
    );
  }

  Widget _customTextField(TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        validator: (value) => value!.isEmpty ? "cannot empty" : null,
        controller: controller,
        decoration: const InputDecoration(
            hintText: "Enter title here", border: InputBorder.none),
      ),
    );
  }
}
