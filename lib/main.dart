import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wellceno_ui/bloc_file/bloc/wallceno_bloc.dart';
import 'package:wellceno_ui/bloc_file/bloc2/bloc/tradingwallceno_bloc.dart';
import 'package:wellceno_ui/bloc_file/seved_wallpaper/seved_wallpaper_bloc.dart';
import 'package:wellceno_ui/db_helper/db_helper.dart';

import 'api_helper/api_helper.dart';
import 'screens/onbording.dart/splash_screens.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => WallcenoBloc(api_helper: Api_Helper()),
    ),
    BlocProvider(
        create: (context) => TradingwallcenoBloc(api_helper: Api_Helper())),
    BlocProvider(
        create: (context) => SevedWallpaperBloc(myDBHelper: MyDBHelper()))
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreens(),
    );
  }
}
