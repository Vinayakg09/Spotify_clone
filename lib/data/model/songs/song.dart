import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_clone/domain/entities/songs/song.dart';

class SongModel {
  String? title;
  String? artist;
  num? duration;
  Timestamp? releaseDate;

  SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
  });

  SongModel.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    artist = data['artist'];
    duration = data['duration'];
    releaseDate = data['releaseDate'];
  }
}

extension SongModelX on SongModel {
  SongEntities toEntities() {
    return SongEntities(
        title: title!,
        artist: artist!,
        duration: duration!,
        releaseDate: releaseDate!);
  }
}
