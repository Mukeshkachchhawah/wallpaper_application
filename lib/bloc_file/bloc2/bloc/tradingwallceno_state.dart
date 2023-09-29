part of 'tradingwallceno_bloc.dart';

@immutable
class TradingwallcenoState {}

class TradingwallcenoStateInitial extends TradingwallcenoState {}

class TradingwallcenoStateLoding extends TradingwallcenoState {}

class TradingwallcenoStateError extends TradingwallcenoState {
  String errorMes;
  TradingwallcenoStateError({required this.errorMes});
}

class TradingwallcenoStateLodade extends TradingwallcenoState {
  DataModal myData;
  TradingwallcenoStateLodade({required this.myData});
}
