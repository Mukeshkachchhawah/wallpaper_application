import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wellceno_ui/custom_Widgets/ui_helper.dart';
import 'package:wellceno_ui/screens/home_page_bottom/savepage/savepage.dart';
import 'package:wellceno_ui/screens/home_page_bottom/wallpaper_profile/privacy_policy.dart';

class WallpaperSetting extends StatefulWidget {
  const WallpaperSetting({super.key});

  @override
  State<WallpaperSetting> createState() => _WallpaperSettingState();
}

class _WallpaperSettingState extends State<WallpaperSetting> {
  void share(BuildContext context) async {
    Share.share(
        "https://play.google.com/store/apps/details?id=com.thinkpeak.quotescreator");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdbebf0),
      appBar: AppBar(
        title: Text(
          "Wallpapers",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xffdbebf0),
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Center(
                child: CircleAvatar(
              radius: 50,
            )),
            mHight(),
            Text("My Wallpaper"),
            mHight(),
            mListTile(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SavePage(),
                  ));
            }, "My Facourites", Icon(Icons.favorite_border),
                Icon(Icons.arrow_forward_ios)),
            mListTile(() {}, "Theme", Icon(Icons.dark_mode),
                Icon(Icons.arrow_forward_ios)),
            mListTile(() {}, "My Downloads", Icon(Icons.file_download_outlined),
                Icon(Icons.arrow_forward_ios)),
            mListTile(() {}, "Auto Wallpapers Changes",
                Icon(Icons.image_outlined), Icon(Icons.arrow_forward_ios)),
            mListTile(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrivacyPolicy(),
                  ));
            }, "Privacy Policy", Icon(Icons.privacy_tip_outlined),
                Icon(Icons.arrow_forward_ios)),
            mListTile(() {
              showModal(context);
            }, "Rate App", Icon(Icons.star_border),
                Icon(Icons.arrow_forward_ios)),
            mListTile(() {
              share(context);
            }, "Share App", Icon(Icons.share), Icon(Icons.arrow_forward_ios)),
          ],
        ),
      ),
    );
  }

  /// show Rate app
  void showModal(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(
                "Rate Us",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              content: Text(
                  "if you like this app, then please take a moment and rate us. it will really help us! Thank you"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Never")),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Not Now")),
                TextButton(onPressed: () {}, child: Text("Yest Sure!"))
              ],
            ));
  }
}
