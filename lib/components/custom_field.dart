import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final TextEditingController dateController;
  final void Function()? onTap;
  final String hintText;
  final IconData icon;
  const CustomField(
      {Key? key,
      required this.dateController,
      required this.onTap,
      required this.hintText,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
          controller: dateController,
          onTap: onTap,
          validator: (value) => value!.isEmpty ? "cannot empty" : null,
          readOnly: true,
          decoration: InputDecoration(
              suffixIcon: Icon(icon),
              hintText: hintText,
              border: InputBorder.none)),
    );
  }
}
