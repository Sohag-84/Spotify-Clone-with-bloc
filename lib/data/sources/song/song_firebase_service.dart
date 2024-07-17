import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone_using_bloc/data/model/song/song.dart';
import 'package:spotify_clone_using_bloc/domain/entites/song/song.dart';
import 'package:spotify_clone_using_bloc/domain/usecase/song/is_favorite_song.dart';
import 'package:spotify_clone_using_bloc/service_locator.dart';

abstract class SongFirebaseService {
  Future<Either> getNewSongs();

  Future<Either> getPlayList();

  Future<Either> addOrRemoveFavoriteSong({required String songId});
  Future<bool> isFavoriteSong({required String songId});
}

class SongFirebaseServiceImpl implements SongFirebaseService {
  @override
  Future<Either<String, List<SongEntity>>> getNewSongs() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releaseDate', descending: true)
          .limit(4)
          .get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        bool isFavorite = await sl<IsFavoriteSongUsecase>().call(
          params: element.reference.id,
        );

        songModel.isFavorite = isFavorite;
        songModel.songId = element.reference.id;

        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } catch (e) {
      log("Error to load songs: $e");
      return const Left("An error occurred, please try again");
    }
  }

  @override
  Future<Either> getPlayList() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releaseDate', descending: true)
          .get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        bool isFavorite = await sl<IsFavoriteSongUsecase>().call(
          params: element.reference.id,
        );

        songModel.isFavorite = isFavorite;
        songModel.songId = element.reference.id;
        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } catch (e) {
      log("Error to load songs: $e");
      return const Left("An error occurred, please try again");
    }
  }

  @override
  Future<Either> addOrRemoveFavoriteSong({required String songId}) async {
    try {
      final fireabaseAuth = FirebaseAuth.instance;
      final firestore = FirebaseFirestore.instance;

      final user = fireabaseAuth.currentUser;
      String uid = user!.uid;

      late bool isFavorite;

      QuerySnapshot favoriteSongs = await firestore
          .collection('Users')
          .doc(uid)
          .collection("Favoties")
          .where("songId", isEqualTo: songId)
          .get();

      if (favoriteSongs.docs.isNotEmpty) {
        await favoriteSongs.docs.first.reference.delete();
        isFavorite = false;
      } else {
        await firestore
            .collection("Users")
            .doc(uid)
            .collection("Favorites")
            .add({
          "songId": songId,
          "addedTime": Timestamp.now(),
        });
        isFavorite = true;
      }
      return Right(isFavorite);
    } catch (e) {
      log("Error: $e");
      return const Left("An error occure");
    }
  }

  @override
  Future<bool> isFavoriteSong({required String songId}) async {
    try {
      final fireabaseAuth = FirebaseAuth.instance;
      final firestore = FirebaseFirestore.instance;

      final user = fireabaseAuth.currentUser;
      String uid = user!.uid;

      QuerySnapshot favoriteSongs = await firestore
          .collection('Users')
          .doc(uid)
          .collection("Favoties")
          .where("songId", isEqualTo: songId)
          .get();

      if (favoriteSongs.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log("Error: $e");
      return false;
    }
  }
}
