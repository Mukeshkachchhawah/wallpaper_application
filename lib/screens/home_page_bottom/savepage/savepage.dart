import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wellceno_ui/bloc_file/bloc/wallceno_bloc.dart';
import 'package:wellceno_ui/bloc_file/seved_wallpaper/seved_wallpaper_bloc.dart';

class SavePage extends StatefulWidget {
  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SevedWallpaperBloc>().add(SavedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffdbebf0),
        appBar: AppBar(
          backgroundColor: Color(0xffdbebf0),
          elevation: 0,
          title: Text(
            "Favorite Wallpaper",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: BlocBuilder<SevedWallpaperBloc, SavedWallpaperState>(
          builder: (context, state) {
            if (state is SavedWallpaperLodadeState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SavedWallpaperErrorState) {
              return Center(
                child: Text("Data Not Found"),
              );
            } else if (state is SavedWallpaperLodadeState) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemCount: state.arrData.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(color: Colors.green,
                    image: DecorationImage(image: state.arrData[index]['img'])
                         // image: DecorationImage(image: NetworkImage("a"))
                        ),
                  );
                },
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
