import 'dart:convert';

import 'package:admin_clean_arch/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource {
  final String baseUrl;

  AuthRemoteDataSource({required this.baseUrl});

  Future<UserModel> login(String mobileNumber, String userType) async {
    final response = await http.post(
      Uri.parse('$baseUrl/UsersAdmin'),
      body: jsonEncode({'MobileNo': mobileNumber, 'LogType': userType}),
      headers: {'Content-Type': 'application/json'},
    );

    return UserModel.fromString(response.body);
  }
}
