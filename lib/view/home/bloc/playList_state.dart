import 'package:spotify_clone/domain/entities/songs/song.dart';

abstract class PlayListState {}

class PlayListLoading extends PlayListState {}

class PlayListLoaded extends PlayListState {
  final List<SongEntities> songs;
  PlayListLoaded({required this.songs});
}

class PlayListFailure extends PlayListState {}
