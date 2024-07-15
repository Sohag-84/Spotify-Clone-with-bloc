import 'package:spotify_clone_using_bloc/domain/entites/song/song.dart';

abstract class PlaylistState {}

class PlaylistLoading extends PlaylistState {}

class PlaylistLoaded extends PlaylistState {
  final List<SongEntity> songs;
  PlaylistLoaded({required this.songs});
}

class PlaylistLoadFailure extends PlaylistState {}
