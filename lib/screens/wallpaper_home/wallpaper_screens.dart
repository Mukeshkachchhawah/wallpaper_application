import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:wallpaper/wallpaper.dart';

import '../../custom_Widgets/custombutton.dart';

class WallpaperScreen extends StatelessWidget {
  String img;
  double? mHeidth;
  double? mwidth;

  WallpaperScreen({required this.img});

  @override
  Widget build(BuildContext context) {
    mHeidth = MediaQuery.of(context).size.height;
    mwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage("${img}"),

            /// "https://i.pinimg.com/736x/1a/47/3f/1a473f3c3cc2258a151980652fb2473d.jpg"
          ),
        ),
        child: Column(children: [
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
                  ontap: () {},
                  title: "Info",
                  icon: Icons.info,
                  color: Colors.grey.withOpacity(0.8),
                ),
                CustomButton(
                  ontap: downloadWallpaepr,
                  title: "Save",
                  icon: Icons.download,
                  color: Colors.grey.withOpacity(0.8),
                ),
                CustomButton(
                  ontap: () {},
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

  void downloadWallpaepr() async {
    /// wallapaper background img
    ///  then await me value lekar aayega futere me
    GallerySaver.saveImage(img).then((value) {
      print(value);
    });
  }

  void setWallpaper() {
    var stremProgress = Wallpaper.imageDownloadProgress(img);

    stremProgress.listen((event) {
      print(event);
    }, onDone: () async {
      /// wallpaper set dispaly
      /// add widget
      var check = await Wallpaper.homeScreen(
          height: mHeidth!,
          width: mwidth!,
          options: RequestSizeOptions.RESIZE_EXACT);
      print(check);
    }, onError: (e) {
      print("Error");
    });
  }
}
