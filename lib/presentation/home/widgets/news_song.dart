import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone_using_bloc/core/config/constants/app_urls.dart';
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
      itemBuilder: (context, index) {
        return SizedBox(
          height: 166,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(coverPhotoList[index]),
                    ),
                  ),
                ),
              ),
              Text(songs[index].title)
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
