import 'package:dio/dio.dart';

class ApiService {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://217.160.204.113/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  static Future<Response> login(String email, String password) {
    return dio.post(
      'api/admin/auth/public/login',
      data: {
        'email': email,
        'password': password,
      },
    );
  }

  static Future<Response> getEvents(String token) {
    return dio.get(
      'api/admin/event/list',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
  }
}
