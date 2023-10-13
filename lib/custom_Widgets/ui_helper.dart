import 'package:flutter/material.dart';

Widget mListTile(
    VoidCallback onTap, String text, Icon ledingIcon, Icon tralingIcon) {
  return ListTile(
    onTap: onTap,
    leading: ledingIcon,
    title: Text(text),
    trailing: tralingIcon,
  );
}

Widget mHight() {
  return SizedBox(
    height: 10,
  );
}

Widget mWidght() {
  return SizedBox(
    width: 10,
  );
}
