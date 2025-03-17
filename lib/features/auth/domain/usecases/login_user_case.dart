import 'package:admin_clean_arch/features/auth/domain/entities/user_entity.dart';
import 'package:admin_clean_arch/features/auth/domain/repositories/auth_repository.dart';

class LoginUserCase {
  final AuthRepository authRepository;

  LoginUserCase({required this.authRepository});

  Future<UserEntity> call(mobileNumber, userType) {
    return authRepository.login(mobileNumber, userType);
  }
}
