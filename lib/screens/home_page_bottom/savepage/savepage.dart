import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wellceno_ui/bloc_file/bloc/wallceno_bloc.dart';

class SavePage extends StatelessWidget {
  const SavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffdbebf0),
        appBar: AppBar(
          title: Text("Save"),
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
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(color: Colors.red),
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
