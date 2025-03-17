abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String mobileNumber;
  final String userType;

  LoginEvent({required this.mobileNumber, required this.userType});
}
