import 'package:dartz/dartz.dart';
import 'package:spotify_clone_using_bloc/data/model/auth/create_user_req.dart';

abstract class AuthRepository {
  Future<void> signin();
  Future<Either> signup(CreateUserReq createUserReq);
}
