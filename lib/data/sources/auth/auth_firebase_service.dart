import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/auth/create_user_req.dart';
import '../../model/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SigninUserReq signinUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );
      return const Right("Sign In was successful");
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == 'invalid-email') {
        message = "No user found for that email";
      } else if (e.code == 'invalid-credential') {
        message = "Wrong password provided for that email";
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(data.user!.uid)
          .set({
        "name": createUserReq.fullName,
        "email": data.user?.email ?? "",
      });

      return const Right("Sign up was successful");
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == 'weak-password') {
        message = "The password provided is too weak";
      } else if (e.code == 'email-already-in-use') {
        message = "The account already exists for that email";
      }

      return Left(message);
    } catch (e) {
      log("Error: $e");
      return Left("An unexpected error occurred: $e");
    }
  }
}
