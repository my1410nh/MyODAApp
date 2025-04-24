import 'package:dio/dio.dart';
import 'package:myodaapp/core/constants.dart';  

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Constants.baseUrl,  
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  Future<String?> authenticate(String email, String password) async {
    try {
      final response = await _dio.post(
        Constants.loginUrl,  
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        return response.data['token'];  
      } else {
        return null;
      }
    } catch (e) {
      print('Login API error: $e');
      return null;
    }
  }

  Future<List<dynamic>?> fetchEvents(String token) async {
    try {
      final response = await _dio.get(
        Constants.eventsUrl,  
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        return response.data['events'];  
      } else {
        return null;
      }
    } catch (e) {
      print('Fetch Events API error: $e');
      return null;
    }
  }
}
