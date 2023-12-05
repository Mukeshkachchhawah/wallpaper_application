import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wellceno_ui/db_helper/db_helper.dart';

part 'seved_wallpaper_event.dart';
part 'seved_wallpaper_state.dart';

class SevedWallpaperBloc
    extends Bloc<SevedWallpaperEvent, SavedWallpaperState> {
  MyDBHelper myDBHelper;
  SevedWallpaperBloc({required this.myDBHelper})
      : super(SavedWallpaperInitialState()) {
    on<FavoriteWallpaper>((event, emit) async {
      emit(SavedWallpaperLodingState());
      var response = myDBHelper.addNote(id: event.id, img: event.img);

      if (response == true) {
        var favWallpaper = await myDBHelper.fetchAllNotes();
        emit(SavedWallpaperLodadeState(arrData: favWallpaper));
      } else {
        emit(SavedWallpaperErrorState(notSavedImage: "Not Found Image"));
      }
    });

    on<SavedEvent>((event, emit) async {
      emit(SavedWallpaperLodingState());
      var favWallpaper = await myDBHelper.fetchAllNotes();
      if (favWallpaper.isNotEmpty) {
        emit(SavedWallpaperLodadeState(arrData: favWallpaper));
      } else {
        emit(SavedWallpaperErrorState(notSavedImage: "Not Data Found"));
      }
    });
  }
}
