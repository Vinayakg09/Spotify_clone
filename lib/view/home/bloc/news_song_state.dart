import 'package:spotify_clone/domain/entities/songs/song.dart';

abstract class NewsSongsState {}

class NewsSongsLoading extends NewsSongsState {}

class NewsSongsLoaded extends NewsSongsState {
  final List<SongEntities> songs;
  NewsSongsLoaded({required this.songs});
}

class NewsSongsFailure extends NewsSongsState {}
