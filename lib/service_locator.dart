import 'package:get_it/get_it.dart';
import 'package:spotify_clone_using_bloc/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_clone_using_bloc/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone_using_bloc/domain/repository/auth/auth.dart';
import 'package:spotify_clone_using_bloc/domain/usercases/auth/signup.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<SignupUseCase>(SignupUseCase());
}
