import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/login_response.dart';

class LoginViewModel extends ChangeNotifier {
  bool isLoading = false;
  String? error;
  String? token;

  Future<bool> login(String email, String password) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await ApiService.login(email, password);
      token = LoginResponse.fromJson(response.data).token;
      error = null;
      return true;
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        error = 'Unauthorized. Please check your credentials.';
      } else {
        error = e.message;
      }
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
