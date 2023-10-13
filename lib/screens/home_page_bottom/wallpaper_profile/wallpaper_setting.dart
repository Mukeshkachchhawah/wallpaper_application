import 'package:flutter/material.dart';
import 'package:wellceno_ui/custom_Widgets/ui_helper.dart';

class WallpaperSetting extends StatelessWidget {
  const WallpaperSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdbebf0),
      appBar: AppBar(
        title: Text(
          "User Profile",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xffdbebf0),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: Column(
          children: [
            Center(
                child: CircleAvatar(
              radius: 50,
            )),
            mHight(),
            Text("User Name"),
            mHight(),
            mListTile(() {
              print("User Name");
            }),
            mListTile(() {
                    print("Last Name Name");
            }),
            mListTile(() {
                 print("Last Name Name");
            }),
            mListTile(() {}),
            mListTile(() {}),
            mListTile(() {}),
          ],
        ),
      ),
    );
  }
}
