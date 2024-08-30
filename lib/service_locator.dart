import 'package:get_it/get_it.dart';
import 'package:spotify_clone/data/repository/auth/auth_repo_impl.dart';
import 'package:spotify_clone/data/repository/song/song_repo_impl.dart';
import 'package:spotify_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone/data/sources/songs/song_firebase_service.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';
import 'package:spotify_clone/domain/repository/song/song.dart';
import 'package:spotify_clone/domain/usescases/auth/signIn.dart';
import 'package:spotify_clone/domain/usescases/auth/signUp.dart';
import 'package:spotify_clone/domain/usescases/song/get_news_song.dart';
import 'package:spotify_clone/domain/usescases/song/get_playlist.dart';

final sl = GetIt.instance;

Future<void> initializeDepandencies() async {
  sl.registerSingleton<AuthFirebaseService>(
    AuthFireBaseImpl()
  );

  sl.registerSingleton<SongFireBaseService>(
    SongFireBaseServiceImpl()
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );

  sl.registerSingleton<SongsRepository>(
    SongRepositoryImpl()
  );

  sl.registerSingleton<SignUpUse>(
    SignUpUse()
  );

  sl.registerSingleton<SignInUse>(
    SignInUse()
  );

  sl.registerSingleton<GetNewSongUse>(
    GetNewSongUse()
  );

  sl.registerSingleton<GetPlayListUse>(
    GetPlayListUse()
  );
}
