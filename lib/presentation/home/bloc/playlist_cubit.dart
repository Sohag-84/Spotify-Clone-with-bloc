import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone_using_bloc/domain/usecase/song/get_playlist.dart';
import 'package:spotify_clone_using_bloc/presentation/home/bloc/playlist_state.dart';
import '../../../service_locator.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  PlaylistCubit() : super(PlaylistLoading());

  Future<void> getPlaylist() async {
    var returnedSongs = await sl<GetPlayListUseCase>().call();
    returnedSongs.fold((l) {
      emit(PlaylistLoadFailure());
    }, (data) {
      emit(PlaylistLoaded(songs: data));
    });
  }
}
