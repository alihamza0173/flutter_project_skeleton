import '../models/data/user_data.dart';
import '../models/responses/api_response.dart';
import '../utils/dio.dart';

class AuthService {
  const AuthService();

  Future<UserData> login({
    required final String email,
    required final String password,
  }) async {
    final response = await dio.post(
      'user/auth/login',
      data: {'email': email, 'password': password},
    );
    return UserData.fromDynamic(ApiResponse(response.data).data);
  }
}

const authService = AuthService();
