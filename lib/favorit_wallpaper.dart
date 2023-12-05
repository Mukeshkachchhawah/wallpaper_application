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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 9 / 16),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://marketplace.canva.com/EAFFA57Y2xc/1/0/900w/canva-black-white-3d-love-butterfly-phone-wallpaper-A8ren-f692c.jpg"),
                        fit: BoxFit.cover)),
              );
            },
          ),
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
