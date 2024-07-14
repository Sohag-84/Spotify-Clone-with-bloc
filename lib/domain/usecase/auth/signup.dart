import 'package:dartz/dartz.dart';
import 'package:spotify_clone_using_bloc/core/usecase/usecase.dart';
import 'package:spotify_clone_using_bloc/data/model/auth/create_user_req.dart';
import 'package:spotify_clone_using_bloc/domain/repository/auth/auth.dart';
import 'package:spotify_clone_using_bloc/service_locator.dart';

class SignupUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async{
    return sl<AuthRepository>().signup(params!);
  }
}
