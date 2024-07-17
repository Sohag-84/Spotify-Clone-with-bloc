import 'package:dartz/dartz.dart';

abstract class SongRepository {
  Future<Either> getNewSongs();

  Future<Either> getPlayList();

  Future<Either> addOrRemoveFavoriteSong({required String songId});
  Future<bool> isFavoriteSong({required String songId});
}
