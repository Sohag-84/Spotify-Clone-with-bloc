import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone_using_bloc/domain/entites/song/song.dart';
import 'package:spotify_clone_using_bloc/domain/usecase/song/get_favorite_songs.dart';
import 'package:spotify_clone_using_bloc/service_locator.dart';

import 'favorite_song_state.dart';

class FavoriteSongCubit extends Cubit<FavoriteSongState> {
  FavoriteSongCubit() : super(FavoriteSongLoading());

  List<SongEntity> favoriteSongs = [];
  Future<void> getFavoriteSongs() async {
    var result = await sl<GetFavoriteSongsUseCase>().call();

    result.fold(
      (l) => emit(FavoriteSongFailure()),
      (r) {
        favoriteSongs = r;
        emit(FavoriteSongLoaded(favoriteSongs: favoriteSongs));
      },
    );
  }

  void removeSong({required int index}) {
    favoriteSongs.removeAt(index);
    emit(FavoriteSongLoaded(favoriteSongs: favoriteSongs));
  }
}
