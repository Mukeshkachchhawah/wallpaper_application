part of 'seved_wallpaper_bloc.dart';

@immutable
class SevedWallpaperEvent {}

class FavoriteWallpaper extends SevedWallpaperEvent {
  String img;
  String id;
  FavoriteWallpaper({required this.img, required this.id});
}

class SavedEvent extends SevedWallpaperEvent {}
