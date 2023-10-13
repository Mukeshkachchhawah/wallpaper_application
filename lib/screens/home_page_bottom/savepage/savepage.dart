import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wellceno_ui/bloc_file/bloc/wallceno_bloc.dart';

class SavePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffdbebf0),
        appBar: AppBar(
          backgroundColor: Color(0xffdbebf0),
          elevation: 0,
          title: Text(
            "Favorit",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: BlocBuilder<WallcenoBloc, WallcenoState>(
          builder: (context, state) {
            if (state is WallcenoLodingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WallcenoErrorState) {
              return Center(
                child: Text("Data Not Found"),
              );
            } else if (state is WallcenoLodadeState) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(color: Colors.green
                        //  image: DecorationImage(image: NetworkImage("${img}"))
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
