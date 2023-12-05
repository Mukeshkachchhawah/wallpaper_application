import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wellceno_ui/bloc_file/bloc2/bloc/tradingwallceno_bloc.dart';
import 'package:wellceno_ui/screens/wallpaper_home/wallpaper_screens.dart';

import '../../../../custom_Widgets/title_widget.dart';
import '../../../../image_List/image_list.dart';
import '../../../wallpaper_home/categor_wallpaper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  bool isSeletColor = false;
  var mediaQuer = GlobalKey<FormState>();

  /// catagoriy varible
  var data = Constants.result;
  //// catagoriy colors
  var color = SeletColor.colors;
  bool isSelectedColor = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<TradingwallcenoBloc>().add(GetTradingwallceno());
  }

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
                        child: ColorTouns(),
                        //  Color_Tone(queryControllerl: searchController.text),
                        title: "The color tone"),
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
                      title: 'Best Of the Months',

                      /// add list image name
                      child: BestOfMonth(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TitleAndWidget(
                        child: ColorTouns(),
                        //  Color_Tone(queryControllerl: searchController.text),
                        title: "The color tone chocie image"),
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

//// best of months wallpaper
  Widget BestOfMonth() {
    return BlocBuilder<TradingwallcenoBloc, TradingwallcenoState>(
      builder: (context, state) {
        if (state is TradingwallcenoStateLoding) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TradingwallcenoStateError) {
          return Center(
            child: Text(state.errorMes),
          );
        } else if (state is TradingwallcenoStateLodade) {
          return SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: state.myData.photos!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WallpaperScreen(
                              img: state.myData.photos![index].src!.portrait!),
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: 180,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                state.myData.photos![index].src!.portrait!),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }

//// colortone

  Widget ColorTouns() {
    return
        /* 
    SizedBox(
      height: 70,
      child: ListView.builder(
        itemCount: seletedColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: [
              /*    Text("${SeletColor.colors[index]['name']}"),
              SizedBox(
                height: 10,
              ), */
              InkWell(
                onTap: () {
                  isSeletColor = true;
                  // print(queryController.text.toString());
                  print("ontap click");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Categori_Wallpaper(
                              query: searchController.text.toString() != " "
                                  ? searchController.text.toString()
                                  : "girl",
                              colorCode: seletedColors[index]['name'],
                            )),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  height: 60,
                  width: 50,
                  decoration: BoxDecoration(
                      color: seletedColors[index]['color'],
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          );
        },
      ),
    );
  */

        SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: color.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: InkWell(
                    onTap: () {
                      isSelectedColor = true;

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Categori_Wallpaper(
                              query: searchController.text.toString() != ""
                                  ? searchController.text.toString()
                                  : "Girl",
                              colorCode: color[index]["name"],
                            ),
                          ));
                    },
                    child: Container(
                      width: 60,

                      // width: media.orientation == Orientation.portrait
                      //     ? media.size.width * .1
                      //     : media.size.width * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: color[index]["color"],
                      ),
                    ),
                  ),
                );
              },
            ));
  }

  /// categories Wallpaper

  Widget Categories() {
    var media = MediaQuery.of(context);
    return SizedBox(
      height: 750,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 16 / 9),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Categori_Wallpaper(
                      query: data[index]['name'],
                    ),
                  ));
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("${data[index]["img"]}"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "${data[index]["name"]}",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
