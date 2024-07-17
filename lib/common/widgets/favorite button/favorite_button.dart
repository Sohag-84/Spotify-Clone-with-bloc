import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone_using_bloc/common/bloc/favorite%20button/favorite_button_cubit.dart';
import 'package:spotify_clone_using_bloc/common/bloc/favorite%20button/favorite_button_state.dart';
import 'package:spotify_clone_using_bloc/core/config/theme/app_colors.dart';
import 'package:spotify_clone_using_bloc/domain/entites/song/song.dart';

class FavoriteButton extends StatelessWidget {
  final SongEntity songEntity;
  const FavoriteButton({super.key, required this.songEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoriteButtonCubit(),
      child: BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
        builder: (context, state) {
          if (state is FavoriteButtonInitial) {
            IconButton(
              onPressed: () {
                context
                    .read<FavoriteButtonCubit>()
                    .favoriteButtonUpdated(songId: songEntity.songId);
              },
              icon: Icon(
                songEntity.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_outline_outlined,
                color: AppColors.darkGrey,
              ),
            );
          }
          if (state is FavoriteButtonUpdated) {
            IconButton(
              onPressed: () {
                context
                    .read<FavoriteButtonCubit>()
                    .favoriteButtonUpdated(songId: songEntity.songId);
              },
              icon: Icon(
                state.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_outline_outlined,
                color: AppColors.darkGrey,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
