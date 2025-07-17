import 'package:flutter/material.dart';

class LeaveFormController with ChangeNotifier {
  String? selectedLeaveType;
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;
  String reason = '';
  String leavePeriod = 'Full Day';       // ✅ Added
  String coveredBy = 'John Doe';         // ✅ Added

  void reset() {
    selectedLeaveType = null;
    selectedStartDate = null;
    selectedEndDate = null;
    reason = '';
    leavePeriod = 'Full Day';
    coveredBy = 'John Doe';
    notifyListeners();
  }
}
