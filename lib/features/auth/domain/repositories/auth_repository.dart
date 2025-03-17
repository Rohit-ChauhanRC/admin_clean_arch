import 'package:admin_clean_arch/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String mobileNumber, String userType);
}
