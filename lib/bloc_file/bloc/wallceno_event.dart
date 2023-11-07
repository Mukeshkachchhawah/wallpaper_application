part of 'wallceno_bloc.dart';

@immutable
class WallcenoEvent {}

class GetSearchWallper extends WallcenoEvent {
  String query;
  String? colorCode;
  int? page;

  GetSearchWallper({required this.query, this.colorCode, this.page});
}

class GetTradingWallpaper extends WallcenoEvent {}
