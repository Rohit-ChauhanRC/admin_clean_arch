import 'package:admin_clean_arch/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:admin_clean_arch/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:admin_clean_arch/features/auth/domain/repositories/auth_repository.dart';
import 'package:admin_clean_arch/features/auth/domain/usecases/login_user_case.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void setupDependencies() {
  const String baseUrl = 'http://plant.maklife.in:6027/api';

  // Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(baseUrl: baseUrl),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authRemoteDataSource: sl()),
  );

  // Use cases

  sl.registerLazySingleton<LoginUserCase>(
    () => LoginUserCase(authRepository: sl()),
  );
}
