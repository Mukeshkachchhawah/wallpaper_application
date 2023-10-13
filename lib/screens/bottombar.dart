import 'package:flutter/material.dart';
import 'package:wellceno_ui/screens/home_page_bottom/wallpaper_profile/wallpaper_setting.dart';

import 'home_page_bottom/home_page/home/homePage.dart';
import 'home_page_bottom/savepage/savepage.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int seletIndex = 0;

  List<Widget> _pages = [
    HomePage(),
    SavePage(),
    WallpaperSetting(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[seletIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.red,
          currentIndex: seletIndex,
          onTap: onitemTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_view_rounded), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.file_download_outlined), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.perm_identity), label: "")
          ]),
    );
  }

  void onitemTapped(int index) {
    setState(() {
      seletIndex = index;
    });
  }
}
