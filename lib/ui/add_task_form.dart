import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/components/myappbar.dart';
import 'package:task_management_app/theme.dart';
import 'package:task_management_app/utils/constant.dart';

import '../provider/theme_provider.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  TextEditingController titleC = TextEditingController();
  TextEditingController noteC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = context.watch<StreamTheme>().isDarkMode;

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
            customTextField(titleC),
            Text(
              "Note",
              style: subHeadingStyle,
            ),
            const SizedBox(
              height: 5,
            ),
            customTextField(noteC),
            Text(
              "Date",
              style: subHeadingStyle,
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget customTextField(TextEditingController controller) {
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
              hintText: "Enter title here", border: InputBorder.none)),
    );
  }
}
