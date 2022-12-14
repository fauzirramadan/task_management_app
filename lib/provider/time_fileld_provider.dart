// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeFieldProvider with ChangeNotifier {
  final TextEditingController _startTimeInput = TextEditingController(text: "");
  final TextEditingController _endTimeInput = TextEditingController(text: "");

  TextEditingController get startTimeInput => _startTimeInput;
  TextEditingController get endTimeInput => _endTimeInput;

  Future<void> chooseTime(
      {required BuildContext context, required bool isStartTime}) async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        initialEntryMode: TimePickerEntryMode.input);

    if (pickedTime != null && isStartTime == true) {
      DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context));
      String formattedTime = DateFormat('HH:mm').format(parsedTime);
      _startTimeInput.text = formattedTime;
      notifyListeners();
    } else if (pickedTime != null && isStartTime == false) {
      DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context));
      String formattedTime = DateFormat('HH:mm').format(parsedTime);
      _endTimeInput.text = formattedTime;
      notifyListeners();
    }
  }
}
