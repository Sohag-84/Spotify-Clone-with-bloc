import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone_using_bloc/domain/usecase/song/add_or_remove_favorite_song.dart';
import 'package:spotify_clone_using_bloc/service_locator.dart';

import 'favorite_button_state.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  Future<void> favoriteButtonUpdated({required String songId}) async {
    var result = await sl<AddOrRemoveFavoriteSongUsecase>().call(
      params: songId,
    );

    result.fold(
      (l) {},
      (isFavorite) {
        emit(FavoriteButtonUpdated(isFavorite: isFavorite));
      },
    );
  }
}
