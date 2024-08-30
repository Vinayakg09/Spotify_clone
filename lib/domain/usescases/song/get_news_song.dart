import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usescases/usescase.dart';


import '../../../service_locator.dart';
import '../../repository/song/song.dart';

class GetNewSongUse implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async{
    return await sl<SongsRepository>().getNewsSong();
  }
}
