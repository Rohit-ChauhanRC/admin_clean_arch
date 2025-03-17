import 'package:admin_clean_arch/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:admin_clean_arch/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:admin_clean_arch/features/auth/domain/repositories/auth_repository.dart';
import 'package:admin_clean_arch/features/auth/domain/usecases/login_user_case.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final GetIt sl = GetIt.instance;

void setupDependencies() {
  String baseUrl = dotenv.env['BASEURL'].toString();

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
