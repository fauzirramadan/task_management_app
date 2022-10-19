import 'package:flutter/material.dart';

import '../theme.dart';

class MyuButton extends StatelessWidget {
  final void Function()? onTap;
  final String label;
  const MyuButton({super.key, required this.onTap, required this.label});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: primaryColor,
      minWidth: MediaQuery.of(context).size.width * 0.2,
      height: 45,
      child: Row(
        children: [
          const Icon(
            Icons.add,
            color: white,
          ),
          const SizedBox(
            width: 3,
          ),
          Text(label, style: normalTextStyle.apply(color: white)),
        ],
      ),
    );
  }
}
