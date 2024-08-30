import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usescases/song/get_news_song.dart';
import 'package:spotify_clone/view/home/bloc/news_song_state.dart';

import '../../../service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    var returnedSongs = await sl<GetNewSongUse>().call();

    returnedSongs.fold((l) {
      emit(NewsSongsFailure());
    }, (data) {
      emit(NewsSongsLoaded(songs: data));
    });
  }
}
