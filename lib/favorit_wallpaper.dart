import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FavoritWallpaper extends StatefulWidget {
  String img;
   FavoritWallpaper({required this.img});

  @override
  State<FavoritWallpaper> createState() => _FavoritWallpaperState();
}

class _FavoritWallpaperState extends State<FavoritWallpaper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Wallpaper"),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "${widget.img}"))),
            );
          },
        )

        /* MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://marketplace.canva.com/EAFFA57Y2xc/1/0/900w/canva-black-white-3d-love-butterfly-phone-wallpaper-A8ren-f692c.jpg"))),
          );
        },
      ), */
        );
  }
}
