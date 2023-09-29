part of 'wallceno_bloc.dart';

@immutable
class WallcenoState {}

class WallcenoInitialState extends WallcenoState {}

class WallcenoLodingState extends WallcenoState {}

class WallcenoErrorState extends WallcenoState {
  String errorMes;
  WallcenoErrorState({
    required this.errorMes
  });
}

class WallcenoLodadeState extends WallcenoState {
  DataModal mdata;
  WallcenoLodadeState({required this.mdata});
}
