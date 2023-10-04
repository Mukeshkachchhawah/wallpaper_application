part of 'wallceno_bloc.dart';

@immutable
class WallcenoEvent {}

class GetSearchWallper extends WallcenoEvent {
  String query;
  String? colorCode;
  int? pageNo;

  GetSearchWallper({required this.query, this.colorCode, this.pageNo});
}

class GetTradingWallpaper extends WallcenoEvent {}
