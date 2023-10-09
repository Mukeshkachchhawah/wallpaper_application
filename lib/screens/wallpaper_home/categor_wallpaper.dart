import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;
import 'package:wellceno_ui/bloc_file/bloc/wallceno_bloc.dart';
import 'package:wellceno_ui/modal/photos/photos_modal.dart';

import 'wallpaper_screens.dart';

class Categori_Wallpaper extends StatefulWidget {
  String query;
  String? colorCode;

  Categori_Wallpaper({
    required this.query,
    this.colorCode,
  });

  @override
  State<Categori_Wallpaper> createState() => _Categori_WallpaperState();
}

class _Categori_WallpaperState extends State<Categori_Wallpaper> {
  @override
  late ScrollController mController;
  var totalResults = 0;
  int pageNo = 1;
  List<Photo_Modal> allData = [];

  void initState() {
    // TODO: implement initState
    super.initState();

    /// pagination
    mController = ScrollController()
      ..addListener(() {
        if (mController.position.pixels ==
            mController.position.maxScrollExtent) {
          print("End of Page");
          pageNo++;
          context.read<WallcenoBloc>().add(GetSearchWallper(
              query: widget.query,
              colorCode: widget.colorCode,
              pageNo: pageNo));
        }
      });
    //// trading wallpaper
    /// context.read<WallcenoBloc>().add(GetTradingWallpaper());

    //// search wallpaper
    ////// widget.query == widget are paprent class
    context.read<WallcenoBloc>().add(GetSearchWallper(
          query: widget.query,
          colorCode: widget.colorCode,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        /// BlocLister
        body: BlocListener<WallcenoBloc, WallcenoState>(
      listener: (_, state) {
        if (state is WallcenoLodingState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  "Loding ${pageNo == 1 ? "First Page" : "${pageNo} Page"}")));
        } else if (state is WallcenoErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error : ${state.errorMes}")));
        } else if (state is WallcenoLodadeState) {
          totalResults = state.mdata.total_results!;
          allData.addAll(state.mdata.photos!);
          setState(() {});
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 39),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.query,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "$totalResults Wallpaper available",
              // "${state.mdata.total_results} wallpaper available",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: GridView.builder(
              controller: mController,
              // physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 9 / 16),
              //state.mdata.photos!.length
              /// first time par page 20 image
              /// allData.length +2 22 image
              itemCount: allData.length + 2,
              itemBuilder: (context, index) {
                // chake conding par page 20 image
                if (index == allData.length) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

// // add ++ 20 abo image
                if (index == allData.length + 1) {
                  return Center(
                    child: Text("Loading..."),
                  );
                }
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WallpaperScreen(
                            //// state.mdata.photos!
                            img: allData[index].src!.portrait!,
                          ),
                        ));
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(allData[index].src!.portrait!),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Icon(Icons.favorite_border),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },

              ///
            ))
          ],
        ),
      ),
    ));

    /// expmle Bloc Builder

/* 
    BlocBuilder<WallcenoBloc, WallcenoState>(
      builder: (context, state) {
       
        if (state is WallcenoLodingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WallcenoErrorState) {
          return Center(
            child: Text(state.errorMes),
          );
        } else if (state is WallcenoLodadeState) {
          allData.addAll(state.mdata.photos!);


          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 39),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.query,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "${state.mdata.total_results} wallpaper available",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: GridView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 9 / 16),
                      //state.mdata.photos!.length
                  itemCount: allData.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WallpaperScreen(

                                //// state.mdata.photos!
                                img: allData[index].src!.portrait!,
                              ),
                            ));
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    state.mdata.photos![index].src!.portrait!),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    );
                  },

                  ///
                ))
              ],
            ),
          );
      
      
        }
        return Container();
      },
    ));
   */
  }

//// Api Call By Simple Format
  /* Future<DataModal> getDataImage() async {
    Uri mUri =
        Uri.parse("https://api.pexels.com/v1/search?query=nature&per_page=20");

    var response = await http.get(mUri, headers: {
      "Authorization":
          "BcaJiLbCY4rFp3JX4pXqIqoBqcp5crV6ctGzYjKJKsXCmtysTH2H1NEt"
    });

    if (response.statusCode == 200) {
      var mData = jsonDecode(response.body);
      return DataModal.fromjson(mData);
    } else {
      return DataModal();
    }
  } */
}
