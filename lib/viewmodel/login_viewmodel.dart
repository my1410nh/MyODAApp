// lib/viewmodel/login_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:myodaapp/data/api_services.dart';

class LoginViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  String? _token;

  String? get token => _token;

  // Handle login process
  Future<bool> login(String email, String password) async {
    final token = await _apiService.authenticate(email, password);
    if (token != null) {
      _token = token;
      notifyListeners();  // Notify the UI after successful login
      return true;
    }
    return false;  // Login failed
  }
}
