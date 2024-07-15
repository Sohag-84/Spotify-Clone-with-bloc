import 'package:get_it/get_it.dart';
import 'package:spotify_clone_using_bloc/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_clone_using_bloc/data/repository/song/song_repository_impl.dart';
import 'package:spotify_clone_using_bloc/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone_using_bloc/data/sources/song/song_firebase_service.dart';
import 'package:spotify_clone_using_bloc/domain/repository/auth/auth.dart';
import 'package:spotify_clone_using_bloc/domain/repository/song/song.dart';
import 'package:spotify_clone_using_bloc/domain/usecase/auth/signin.dart';
import 'package:spotify_clone_using_bloc/domain/usecase/auth/signup.dart';
import 'package:spotify_clone_using_bloc/domain/usecase/song/get_new_song.dart';
import 'package:spotify_clone_using_bloc/domain/usecase/song/get_playlist.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<SignupUseCase>(SignupUseCase());

  sl.registerSingleton<SigninUseCase>(SigninUseCase());

  sl.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceImpl(),
  );
  sl.registerSingleton<SongRepository>(SongRepositoryImpl());
  sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());
  sl.registerSingleton<GetPlayListUseCase>(GetPlayListUseCase());
}
