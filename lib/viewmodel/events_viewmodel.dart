// lib/viewmodel/events_viewmodel.dart
import 'package:flutter/material.dart';
import 'package:myodaapp/data/api_services.dart';

class EventsViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<dynamic> _events = [];

  List<dynamic> get events => _events;

  Future<void> fetchEvents(String token) async {
    final events = await _apiService.fetchEvents(token);
    if (events != null) {
      _events = events;
      notifyListeners();  // Notify UI after events are fetched
    }
  }
}
