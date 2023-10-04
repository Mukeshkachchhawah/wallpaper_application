import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wellceno_ui/api_helper/api_helper.dart';
import 'package:wellceno_ui/api_helper/url_api.dart';
import 'package:wellceno_ui/modal/datamodal.dart';

part 'wallceno_event.dart';
part 'wallceno_state.dart';

class WallcenoBloc extends Bloc<WallcenoEvent, WallcenoState> {
  Api_Helper api_helper;
/*   WallcenoBloc({required this.api_helper}) : super(WallcenoInitialState()) {
    on<GetTradingWallpaper>((event, emit) async {
      emit(WallcenoLodingState());
      var response =
          await api_helper.getDataApi("${UrlApi.tradingURL}? per_page=20");

      if (response != null) {
        emit(WallcenoLodadeState(mdata: DataModal.fromjson(response)));
      } else {
        emit(WallcenoErrorState(errorMes: "Internet Error"));
      }
    }); */

  WallcenoBloc({required this.api_helper}) : super(WallcenoInitialState()) {
    on<GetSearchWallper>((event, emit) async {
      emit(WallcenoLodingState());

      try {
        print(
            "${UrlApi.searchURL}?query=${event.query}&per_page=40&color=${event.colorCode ?? ""}&page=${event.pageNo ?? 1}");
        var response = await api_helper.getDataApi(
            "${UrlApi.searchURL}?query=${event.query}&per_page=40&color=${event.colorCode ?? ""}&page=${event.pageNo ?? 1}");

        emit(WallcenoLodadeState(mdata: DataModal.fromjson(response)));
      } catch (e) {
        emit(WallcenoErrorState(errorMes: "Internet Error"));
      }
    });
  }
}
