import 'package:dartz/dartz.dart';
import 'package:spotify_clone_using_bloc/data/model/auth/create_user_req.dart';
import 'package:spotify_clone_using_bloc/data/model/auth/signin_user_req.dart';
import 'package:spotify_clone_using_bloc/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone_using_bloc/domain/repository/auth/auth.dart';
import 'package:spotify_clone_using_bloc/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await sl<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }

  @override
  Future<Either> getUser() async {
    return await sl<AuthFirebaseService>().getUser();
  }
}
