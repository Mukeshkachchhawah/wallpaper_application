import 'package:flutter/material.dart';

import 'home_page_bottom/homePage.dart';
import 'home_page_bottom/savepage.dart';
import 'home_page_bottom/userpage.dart';

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
    UserPage(),
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
        BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.file_download_outlined), label: ""),
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
