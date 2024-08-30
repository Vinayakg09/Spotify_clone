import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/model/songs/song.dart';
import 'package:spotify_clone/domain/entities/songs/song.dart';

abstract class SongFireBaseService {
  Future<Either> getNewsSongs();
  Future<Either> getPlayList();
}

class SongFireBaseServiceImpl extends SongFireBaseService {
  @override
  Future<Either> getNewsSongs() async {
    try {
      List<SongEntities> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releaseDate', descending: true)
          .limit(3)
          .get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        songs.add(songModel.toEntities());
      }

      return Right(songs);
    } catch (e) {
      return const Left("An error occured please try again.");
    }
  }
  
  @override
  Future<Either> getPlayList() async{
    try {
      List<SongEntities> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releaseDate', descending: true)
          .get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        songs.add(songModel.toEntities());
      }

      return Right(songs);
    } catch (e) {
      return const Left("An error occured please try again.");
    }
  }
}
