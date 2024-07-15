import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:spotify_clone_using_bloc/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone_using_bloc/core/config/constants/app_urls.dart';
import 'package:spotify_clone_using_bloc/core/config/theme/app_colors.dart';
import 'package:spotify_clone_using_bloc/domain/entites/song/song.dart';
import 'package:spotify_clone_using_bloc/presentation/home/bloc/news_song_cubit.dart';
import 'package:spotify_clone_using_bloc/presentation/home/bloc/news_song_state.dart';

class NewsSong extends StatelessWidget {
  const NewsSong({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
        builder: (context, state) {
          if (state is NewsSongsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsSongsLoaded) {
            return _song(state.songs);
          }

          return Container();
        },
      ),
    );
  }

  Widget _song(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (context, index) {
        return SizedBox(
          width: 166,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        coverPhotoList[index],
                      ),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 40,
                      width: 40,
                      transform: Matrix4.translationValues(10, 10, 0),
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
                  ),
                ),
              ),
              const Gap(5),
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
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 14,
      ),
      itemCount: songs.length,
    );
  }
}
