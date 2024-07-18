import 'package:dartz/dartz.dart';
import 'package:spotify_clone_using_bloc/data/sources/song/song_firebase_service.dart';
import 'package:spotify_clone_using_bloc/domain/repository/song/song.dart';
import 'package:spotify_clone_using_bloc/service_locator.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either> getNewSongs() async {
    return await sl<SongFirebaseService>().getNewSongs();
  }

  @override
  Future<Either> getPlayList() async {
    return await sl<SongFirebaseService>().getPlayList();
  }

  @override
  Future<Either> addOrRemoveFavoriteSong({required String songId}) async {
    return await sl<SongFirebaseService>()
        .addOrRemoveFavoriteSong(songId: songId);
  }

  @override
  Future<bool> isFavoriteSong({required String songId}) async {
    return await sl<SongFirebaseService>().isFavoriteSong(songId: songId);
  }

  @override
  Future<Either> getUserFavoriteSongs() async {
    return await sl<SongFirebaseService>().getUserFavoriteSongs();
  }
}
