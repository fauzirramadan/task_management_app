import 'package:flutter/material.dart';

class DropDownField extends StatelessWidget {
  final int value;
  final void Function(int?)? onChange;
  const DropDownField({super.key, required this.value, required this.onChange});

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<int>> menuItems = const [
      DropdownMenuItem(value: 5, child: Text("5 minute early")),
      DropdownMenuItem(value: 10, child: Text("10 minute early")),
      DropdownMenuItem(value: 15, child: Text("15 minute early")),
    ];

    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonFormField(
        items: menuItems,
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        onChanged: onChange,
        validator: (value) => value == null ? "cannot empty" : null,
        hint: const Text("Set reminder"),
        elevation: 0,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
