import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFieldProvider with ChangeNotifier {
  final TextEditingController _dateInput = TextEditingController(text: "");

  TextEditingController get dateInput => _dateInput;

  Future<void>? chooseDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2101),
        initialEntryMode: DatePickerEntryMode.input);

    if (pickedDate != null) {
      String formattedDate = DateFormat.yMd().format(pickedDate);
      _dateInput.text = formattedDate;
      notifyListeners();
    }
  }
}
