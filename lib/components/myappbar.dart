import 'package:flutter/material.dart';

PreferredSizeWidget myAppBar(void Function()? onPressed) {
  return AppBar(
    leading: IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.mode_night_outlined,
        color: Colors.grey,
      ),
    ),
    actions: [
      CircleAvatar(
        child: IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
      ),
      const SizedBox(
        width: 10,
      )
    ],
  );
}
