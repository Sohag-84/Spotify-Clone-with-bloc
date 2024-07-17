import 'package:spotify_clone_using_bloc/core/usecase/usecase.dart';
import 'package:spotify_clone_using_bloc/domain/repository/song/song.dart';
import 'package:spotify_clone_using_bloc/service_locator.dart';

class IsFavoriteSongUsecase implements UseCase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await sl<SongRepository>().isFavoriteSong(songId: params!);
  }
}
