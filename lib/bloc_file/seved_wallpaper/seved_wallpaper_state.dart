part of 'seved_wallpaper_bloc.dart';

@immutable
class SavedWallpaperState {}

class SavedWallpaperInitialState extends SavedWallpaperState {}

class SavedWallpaperLodingState extends SavedWallpaperState {}

class SavedWallpaperErrorState extends SavedWallpaperState {
  String notSavedImage;
  SavedWallpaperErrorState({required this.notSavedImage});
}

class SavedWallpaperLodadeState extends SavedWallpaperState {
  List<Map<String, dynamic>> arrData;
  SavedWallpaperLodadeState({required this.arrData});
}
