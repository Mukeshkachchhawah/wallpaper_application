import 'package:flutter/material.dart';


class SavePage extends StatelessWidget {
  const SavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdbebf0),
      appBar: AppBar(
        title: Text("Save"),
      ),
      body: TextField(
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder()),
      ),
    );
  }
}
