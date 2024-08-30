import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/core/configs/helpers/is_darkmode.dart';
import 'package:spotify_clone/core/configs/themes/app_colors.dart';
import 'package:spotify_clone/domain/entities/songs/song.dart';
import 'package:spotify_clone/view/song_player/bloc/song_player_cubit.dart';
import 'package:spotify_clone/view/song_player/bloc/song_player_state.dart';
import 'package:spotify_clone/view/widgets/appBar/basic_appbar.dart';

import '../../../core/configs/constants/app_url.dart';

class SongPlayer extends StatelessWidget {
  final SongEntities songEntities;
  const SongPlayer({required this.songEntities, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Text(
          "Now Playing",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        action: IconButton(
            onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
      ),
      body: BlocProvider(
        create: (_) => SongPlayerCubit()
          ..loadSong(
            '${AppUrls.songfireStorage}${songEntities.title}.mp3?${AppUrls.mediaAlt}',
          ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            children: [
              _songCover(context),
              const SizedBox(
                height: 20,
              ),
              _songDetail(),
              const SizedBox(
                height: 40,
              ),
              _songPlayer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _songCover(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              '${AppUrls.coverfireStorage}${songEntities.title} Cover.jpeg?${AppUrls.mediaAlt}',
            ),
          )),
    );
  }

  Widget _songDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songEntities.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              songEntities.artist,
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border_rounded,
            color: Color(0xff565656),
            size: 30,
          ),
        ),
      ],
    );
  }

  Widget _songPlayer() {
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(
      builder: (context, state) {
        if (state is SongPlayerLoading) {
          return const CircularProgressIndicator();
        }
        if (state is SongPlayerLoaded) {
          return Column(
            children: [
              Slider(
                  value: context
                      .read<SongPlayerCubit>()
                      .songPosition
                      .inSeconds
                      .toDouble(),
                  min: 0.0,
                  max: context
                      .read<SongPlayerCubit>()
                      .songDuration
                      .inSeconds
                      .toDouble(),
                  allowedInteraction: SliderInteraction.tapAndSlide,
                  activeColor: context.isDarkMode ? Colors.white : AppColor.darkgrey,
                  onChanged: (value) {}),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatDuartion(
                      context.read<SongPlayerCubit>().songPosition)),
                  Text(formatDuartion(
                      context.read<SongPlayerCubit>().songDuration))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  context.read<SongPlayerCubit>().playOrpauseSong();
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColor.primary),
                  child: Icon(
                    context.read<SongPlayerCubit>().audioPlayer.playing
                        ? Icons.pause
                        : Icons.play_arrow_rounded,
                    size: 30,
                  ),
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }

  String formatDuartion(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
