import 'package:dartz/dartz.dart';
import 'package:spotify_clone_using_bloc/core/usecase/usecase.dart';
import 'package:spotify_clone_using_bloc/domain/repository/auth/auth.dart';
import 'package:spotify_clone_using_bloc/service_locator.dart';

class GetUserUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return sl<AuthRepository>().getUser();
  }
}
