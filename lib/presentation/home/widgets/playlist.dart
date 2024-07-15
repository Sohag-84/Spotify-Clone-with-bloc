import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:spotify_clone_using_bloc/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone_using_bloc/presentation/home/bloc/playlist_cubit.dart';
import 'package:spotify_clone_using_bloc/presentation/home/bloc/playlist_state.dart';

import '../../../core/config/theme/app_colors.dart';
import '../../../domain/entites/song/song.dart';

class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlaylistCubit()..getPlaylist(),
      child: BlocBuilder<PlaylistCubit, PlaylistState>(
        builder: (context, state) {
          if (state is PlaylistLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PlaylistLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Playlist",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "See More",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFC6C6C6),
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  _songs(state.songs),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: context.isDarkMode
                        ? AppColors.darkGrey
                        : const Color(0xFFE6E6E6),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: context.isDarkMode
                        ? const Color(0xFF959595)
                        : const Color(0xFF555555),
                  ),
                ),
                const Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      songs[index].title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      songs[index].artist,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  songs[index].duration.toString().replaceAll(".", ":"),
                ),
                const Gap(15),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_rounded,
                    color: AppColors.darkGrey,
                  ),
                ),
              ],
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
      itemCount: songs.length,
    );
  }
}
