import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wellceno_ui/bloc_file/bloc/wallceno_bloc.dart';
import 'package:wellceno_ui/bloc_file/bloc2/bloc/tradingwallceno_bloc.dart';

import '../../wallpaper_home/wallpaper_screens.dart';

class BestOfMonth extends StatefulWidget {
  @override
  State<BestOfMonth> createState() => _BestOfMonthState();
}

class _BestOfMonthState extends State<BestOfMonth> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<TradingwallcenoBloc>().add(GetTradingwallceno());
  }

  // List<dynamic> bestofmonth;
  @override
  Widget build(BuildContext context) {


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
}
