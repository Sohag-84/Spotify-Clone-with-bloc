import 'package:dartz/dartz.dart';
import 'package:spotify_clone_using_bloc/core/usecase/usecase.dart';
import 'package:spotify_clone_using_bloc/data/model/auth/signin_user_req.dart';
import 'package:spotify_clone_using_bloc/domain/repository/auth/auth.dart';
import 'package:spotify_clone_using_bloc/service_locator.dart';

class SigninUseCase implements UseCase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    return sl<AuthRepository>().signin(params!);
  }
}
