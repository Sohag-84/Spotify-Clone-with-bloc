import 'package:spotify_clone_using_bloc/domain/entites/song/song.dart';

abstract class FavoriteSongState {}

class FavoriteSongLoading extends FavoriteSongState {}

class FavoriteSongLoaded extends FavoriteSongState {
  List<SongEntity> favoriteSongs;
  FavoriteSongLoaded({required this.favoriteSongs});
}

class FavoriteSongFailure extends FavoriteSongState {}
