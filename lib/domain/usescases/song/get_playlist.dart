import 'package:dartz/dartz.dart';

import '../../../core/usescases/usescase.dart';
import '../../../service_locator.dart';
import '../../repository/song/song.dart';

class GetPlayListUse implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async{
    return await sl<SongsRepository>().getPlayList();
  }
}