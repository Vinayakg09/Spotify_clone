import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usescases/song/get_playlist.dart';

import '../../../service_locator.dart';
import 'playList_state.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());

  Future<void> getPlayList() async {
    var returnedSongs = await sl<GetPlayListUse>().call();

    returnedSongs.fold((l) {
      emit(PlayListFailure());
    }, (data) {
      emit(PlayListLoaded(songs: data));
    });
  }
}
