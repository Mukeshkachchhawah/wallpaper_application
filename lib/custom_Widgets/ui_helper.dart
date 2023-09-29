import 'package:flutter/material.dart';

Widget mListTile(VoidCallback onTap) {
  return ListTile(
    onTap: onTap,
    leading: Icon(Icons.person),
    title: Text("User Name"),
    trailing: Icon(Icons.edit),
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
