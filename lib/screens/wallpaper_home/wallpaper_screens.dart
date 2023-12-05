import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:wallpaper/wallpaper.dart';
import 'package:wellceno_ui/bloc_file/seved_wallpaper/seved_wallpaper_bloc.dart';
// ignore: unused_import
import 'package:wellceno_ui/custom_Widgets/ui_helper.dart';
import 'package:wellceno_ui/favorit_wallpaper.dart';
import 'package:wellceno_ui/modal/photos/photos_modal.dart';

import '../../custom_Widgets/custombutton.dart';

// ignore: must_be_immutable
class WallpaperScreen extends StatefulWidget {
  String img;

  WallpaperScreen({required this.img});

  @override
  State<WallpaperScreen> createState() => _WallpaperScreenState();
}

class _WallpaperScreenState extends State<WallpaperScreen> {
  double? mHeidth;

  double? mwidth;
  bool isfav = false;

  @override
  Widget build(BuildContext context) {
    mHeidth = MediaQuery.of(context).size.height;
    mwidth = MediaQuery.of(context).size.width;

    Future SetWallpaper() {
      return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Set As Wallpaper Screens",
                  style: TextStyle(fontSize: 20),
                ),
                Divider(),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: setBothScreens,
                  child: Text(
                    "Set Both Screens",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: setLockScreens,
                  child: Text(
                    "Lock Screens",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: setHomeWallpaper,
                  child: Text(
                    "Home Screens",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage("${widget.img}"),

            /// "https://i.pinimg.com/736x/1a/47/3f/1a473f3c3cc2258a151980652fb2473d.jpg"
          ),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 750),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  ontap: () {},
                  title: "Info",
                  icon: Icons.info,
                ),
                CustomButton(
                  ontap: downloadWallpaepr,
                  title: "Save",
                  icon: Icons.download,
                ),
                CustomButton(
                  ontap: SetWallpaper,
                  title: "Apply",
                  icon: Icons.brush,
                ),
                CustomButton(
                  ontap: () {
                    setState(() {
                      isfav = !isfav;
                    });
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => FavoritWallpaper(
                    //           img:
                    //               "https://png.pngtree.com/thumb_back/fh260/background/20210727/pngtree-cute-watercolor-fruit-mobile-wallpaper-image_752110.jpg"),
                    //     ));

                    //  context.read<SevedWallpaperBloc>().add(FavoriteWallpaper(img: '', id: id.toString()));
                  },
                  title: "Favorite",
                  icon: isfav ? Icons.favorite_border : Icons.add,
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

  /// download wallpaper
  void downloadWallpaepr() async {
    /// wallapaper background img
    ///  then await me value lekar aayega futere me

    GallerySaver.saveImage(widget.img).then((value) {
      print(value);

      final snackBar = SnackBar(
        content: const Text('image saved in gallery successfully'),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  /// set mobile screes wallpaper
  void setHomeWallpaper() {
    var stremProgress = Wallpaper.imageDownloadProgress(widget.img);

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

  void setLockScreens() {
    var stremProgress = Wallpaper.imageDownloadProgress(widget.img);

    stremProgress.listen((event) {
      print(event);
    }, onDone: () async {
      var check = await Wallpaper.lockScreen(
          height: mHeidth!,
          width: mwidth!,
          options: RequestSizeOptions.RESIZE_EXACT);
      print(check);
    }, onError: (e) {
      print("error");
    });
  }

  void setBothScreens() {
    var stremProgress = Wallpaper.imageDownloadProgress(widget.img);

    stremProgress.listen((event) {
      print(event);
    }, onDone: () async {
      var check = await Wallpaper.bothScreen(
          height: mHeidth!,
          width: mwidth!,
          options: RequestSizeOptions.RESIZE_EXACT);
      print(check);
    }, onError: (e) {
      print("error");
    });
  }
}
