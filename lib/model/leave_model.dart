class LeaveRequestModel {
  final int? leaveRequestId;       // Auto-generated
  final int employeeId;            // FK to employee
  final String leaveType;          // Annual, Sick, etc.
  final String startDate;          // YYYY-MM-DD
  final String endDate;            // YYYY-MM-DD
  final String status;             // Pending, Approved, Rejected
  final int? approvedBy;           // Optional, set when approved

  LeaveRequestModel({
    this.leaveRequestId,
    required this.employeeId,
    required this.leaveType,
    required this.startDate,
    required this.endDate,
    this.status = 'Pending',
    this.approvedBy,
  });

  Map<String, dynamic> toJson() {
    return {
      "employee_id": employeeId,
      "leave_type": leaveType,
      "start_date": startDate,
      "end_date": endDate,
      "status": status,
      "approved_by": approvedBy,
    };
  }
}
