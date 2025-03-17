import 'package:admin_clean_arch/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.data});

  factory UserModel.fromString(String str) {
    return UserModel(data: str);
  }
}
