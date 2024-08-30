import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/core/configs/constants/app_url.dart';
import 'package:spotify_clone/core/configs/helpers/is_darkmode.dart';
import 'package:spotify_clone/core/configs/themes/app_colors.dart';
import 'package:spotify_clone/domain/entities/songs/song.dart';
import 'package:spotify_clone/view/home/bloc/news_song_state.dart';
import 'package:spotify_clone/view/home/bloc/news_songs_cubit.dart';
import 'package:spotify_clone/view/song_player/pages/song_player.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
          builder: (context, state) {
            if (state is NewsSongsLoading) {
              return const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator());
            }
            if (state is NewsSongsLoaded) {
              //print(state.songs);
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: _songs(state.songs),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }

  Widget _songs(List<SongEntities> songs) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          //print(songs);
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SongPlayer(
                    songEntities: songs[index],
                  ),
                ),
              );
            },
            child: SizedBox(
              width: 147,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            '${AppUrls.coverfireStorage}${songs[index].title} Cover.jpeg?${AppUrls.mediaAlt}',
                          ),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 35,
                          height: 35,
                          transform: Matrix4.translationValues(-10, 10, 0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: context.isDarkMode
                                ? AppColor.darkgrey
                                : const Color(0xffE6E6E6),
                          ),
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: context.isDarkMode
                                ? const Color(0xff959595)
                                : const Color(0xff555555),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    songs[index].title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    songs[index].artist,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 14,
          );
        },
        itemCount: songs.length);
  }
}
