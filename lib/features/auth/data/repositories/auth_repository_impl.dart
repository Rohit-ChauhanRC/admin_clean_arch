import 'package:admin_clean_arch/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:admin_clean_arch/features/auth/domain/entities/user_entity.dart';
import 'package:admin_clean_arch/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<UserEntity> login(String mobileNumber, String userType) async {
    return await authRemoteDataSource.login(mobileNumber, userType);
  }
}
