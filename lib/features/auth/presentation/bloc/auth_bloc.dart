import 'package:admin_clean_arch/features/auth/domain/usecases/login_user_case.dart';
import 'package:admin_clean_arch/features/auth/presentation/bloc/auth_event.dart';
import 'package:admin_clean_arch/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUserCase loginUserCase;

  AuthBloc({required this.loginUserCase}) : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final user = await loginUserCase(event.mobileNumber, event.userType);
      emit(AuthSuccess(message: user.data));
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }
}
