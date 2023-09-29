part of 'wallceno_bloc.dart';

@immutable
class WallcenoEvent {}

class GetSearchWallper extends WallcenoEvent {
  String query;
  String? colorCode;
 
  GetSearchWallper({required this.query, this.colorCode});
}

class GetTradingWallpaper extends WallcenoEvent {}
