import 'package:flutter/material.dart';

import '../theme.dart';

class MyuButton extends StatelessWidget {
  void Function()? onTap;
  String label;
  Color buttonColor;
  Widget? icon;
  MyuButton(
      {super.key,
      required this.onTap,
      required this.label,
      required this.buttonColor,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: buttonColor,
      minWidth: MediaQuery.of(context).size.width * 0.2,
      height: 45,
      child: Row(
        children: [
          icon ?? const SizedBox(),
          const SizedBox(
            width: 3,
          ),
          Text(label, style: normalTextStyle.apply(color: white)),
        ],
      ),
    );
  }
}
