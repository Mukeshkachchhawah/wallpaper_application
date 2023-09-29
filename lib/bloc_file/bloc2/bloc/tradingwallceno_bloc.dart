import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wellceno_ui/api_helper/api_helper.dart';
import 'package:wellceno_ui/api_helper/url_api.dart';
import 'package:wellceno_ui/modal/datamodal.dart';

part 'tradingwallceno_event.dart';
part 'tradingwallceno_state.dart';

class TradingwallcenoBloc
    extends Bloc<TradingwallcenoEvent, TradingwallcenoState> {
  Api_Helper api_helper;
  TradingwallcenoBloc({required this.api_helper})
      : super(TradingwallcenoStateInitial()) {
    on<GetTradingwallceno>((event, emit) async {
      emit(TradingwallcenoStateLoding());
      try {
        var response =
            await api_helper.getDataApi("${UrlApi.tradingURL}?per_page=40");
        emit(TradingwallcenoStateLodade(
          myData: DataModal.fromjson(response),
        ));
      } catch (e) {
        emit(TradingwallcenoStateError(errorMes: e.toString()));
      }
    });
  }
}
