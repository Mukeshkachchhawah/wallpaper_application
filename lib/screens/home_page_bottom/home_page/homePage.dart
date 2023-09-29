import 'package:flutter/material.dart';

import '../../../custom_Widgets/title_widget.dart';
import '../../../image_List/image_list.dart';
import '../../wallpaper_home/best_of_month.dart';
import '../../wallpaper_home/categor_wallpaper.dart';
import '../../wallpaper_home/categories.dart';
import '../../wallpaper_home/color_tone.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var mediaQuer = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Color(0xffdbebf0),
        body: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 50),
                      child: TextField(
                        controller: searchController,
                        onSubmitted: (value) {
                          print(value);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Categori_Wallpaper(
                                  query: value,
                                  // seletColor: value,
                                ),
                              ));
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Find Wallpaper',
                            hintStyle: TextStyle(color: Colors.grey),
                            suffixIcon: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Categori_Wallpaper(
                                          query: searchController.text,
                                        ),
                                      ));
                                },
                                child: Icon(Icons.search)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    TitleAndWidget(
                      title: 'Best Of the Month',

                      /// add list image name
                      child: BestOfMonth(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TitleAndWidget(
                        child: Color_Tone(queryControllerl: searchController.text), title: "The color tone"),
                    SizedBox(
                      height: 20,
                    ),
                    TitleAndWidget(child: Categories(), title: 'Categories')
                  ],
                ),
              );

              /// landscape
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 50),
                      child: TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Find Wallpaper',
                            suffixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    TitleAndWidget(
                      title: 'Best Of the Month',

                      /// add list image name
                      child: BestOfMonth(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TitleAndWidget(
                        child: Color_Tone(queryControllerl: searchController.text), title: "The color tone"),
                    SizedBox(
                      height: 20,
                    ),
                    TitleAndWidget(child: Categories(), title: 'Categories')
                  ],
                ),
              );
            }
          },
        ));
  }

  
}
