import 'package:dartz/dartz.dart';
import 'package:spotify_clone_using_bloc/core/usecase/usecase.dart';
import 'package:spotify_clone_using_bloc/domain/repository/song/song.dart';
import 'package:spotify_clone_using_bloc/service_locator.dart';

class AddOrRemoveFavoriteSongUsecase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<SongRepository>().addOrRemoveFavoriteSong(songId: params!);
  }
}
