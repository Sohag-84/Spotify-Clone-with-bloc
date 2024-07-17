import 'package:spotify_clone_using_bloc/domain/entites/auth/user.dart';

class UserModel {
  String? imageUrl;
  String? fullName;
  String? email;

  UserModel({
    required this.imageUrl,
    required this.fullName,
    required this.email,
  });

  UserModel.fromJson(Map<String, dynamic> data) {
    fullName = data['name'];
    email = data['email'];
  }
}

extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      fullName: fullName,
      email: email,
      imageUrl: imageUrl,
    );
  }
}
