import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone_using_bloc/domain/usecase/song/get_new_song.dart';

import '../../../service_locator.dart';
import 'news_song_state.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    var returnedSongs = await sl<GetNewsSongsUseCase>().call();
    returnedSongs.fold((l) {
      emit(NewsSongsLoadFailure());
    }, (data) {
      emit(NewsSongsLoaded(songs: data));
    });
  }
}
