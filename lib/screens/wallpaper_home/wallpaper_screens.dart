import 'package:flutter/material.dart';

import '../../custom_Widgets/custombutton.dart';

class WallpaperScreen extends StatelessWidget {
  String img;

  WallpaperScreen({required this.img});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage("${img}"),

            /// "https://i.pinimg.com/736x/1a/47/3f/1a473f3c3cc2258a151980652fb2473d.jpg"
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                
            mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.favorite_sharp),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 600),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  title: "Info",
                  icon: Icons.info,
                  color: Colors.grey.withOpacity(0.8),
                ),
                CustomButton(
                  title: "Save",
                  icon: Icons.download,
                  color: Colors.grey.withOpacity(0.8),
                ),
                CustomButton(
                  title: "Apply",
                  icon: Icons.brush,
                  color: Colors.blue.withOpacity(0.9),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          )
        ]),
      ),
    );
  }
}
