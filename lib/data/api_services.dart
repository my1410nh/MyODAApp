// lib/data/api_services.dart
import 'package:dio/dio.dart';
import 'package:myodaapp/core/constants.dart';  // Import the Constants class

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Constants.baseUrl,  // Using Constants from the imported file
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    ),
  );

  // Login API call to get the JWT token
  Future<String?> authenticate(String email, String password) async {
    try {
      final response = await _dio.post(
        Constants.loginUrl,  // Using Constants.loginUrl
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        return response.data['token'];  // Return JWT token
      } else {
        return null;
      }
    } catch (e) {
      print('Login API error: $e');
      return null;
    }
  }

  // Fetch events using the Authorization Bearer token
  Future<List<dynamic>?> fetchEvents(String token) async {
    try {
      final response = await _dio.get(
        Constants.eventsUrl,  // Using Constants.eventsUrl
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        return response.data['events'];  // Return events list
      } else {
        return null;
      }
    } catch (e) {
      print('Fetch Events API error: $e');
      return null;
    }
  }
}
