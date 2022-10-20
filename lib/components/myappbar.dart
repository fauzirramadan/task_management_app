import 'package:flutter/material.dart';

PreferredSizeWidget myAppBar(void Function()? onPressed, Icon icon) {
  return AppBar(
    leading: IconButton(
      onPressed: onPressed,
      icon: icon,
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
