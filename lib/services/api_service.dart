import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://217.160.204.113/',
    headers: {'Content-Type': 'application/json'},
  ));

  Future<Response> login(String email, String password) async {
    return _dio.post('api/admin/auth/public/login', data: {
      'email': email,
      'password': password,
    });
  }

  Future<Response> getEvents(String token) async {
    return _dio.get(
      'api/admin/event/list',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }
}
