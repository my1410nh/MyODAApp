import 'package:flutter/material.dart';
import '../../services/api_service.dart';
import 'package:dio/dio.dart';

class LoginViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool isLoading = false;

  bool validatePasswordRules(String password) {
  final isValid = password.length >= 8 &&
      RegExp(r'[A-Z]').hasMatch(password) &&
      RegExp(r'[a-z]').hasMatch(password) &&
      RegExp(r'[0-9]').hasMatch(password) &&
      RegExp(r'[!@#$%^&*(),.?":{}|<>_\-+=\\/~`[\]]').hasMatch(password);

  return isValid;
}

  Future<String?> login(String email, String password) async {
    try {
      isLoading = true;
      notifyListeners();

    // Bypass for testing
    if (email == 'test@gmail.com' && password == 'Test@123') {
      return 'success';
    }

      final response = await _apiService.login(email, password);
      return response.data['token'];
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        return '403';
      }
      return 'error';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
