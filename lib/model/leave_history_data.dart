import 'leave_model.dart';

final List<LeaveRequestModel> mockLeaveHistory = [
  LeaveRequestModel(
    leaveRequestId: 1,
    employeeId: 101,
    leaveType: 'Annual Leave',
    startDate: '2025-09-01',
    endDate: '2025-09-01',
    status: 'Pending',
  ),
  LeaveRequestModel(
    leaveRequestId: 2,
    employeeId: 101,
    leaveType: 'Medical Leave',
    startDate: '2025-08-15',
    endDate: '2025-08-17',
    status: 'Approved',
    approvedBy: 9001,
  ),
  LeaveRequestModel(
    leaveRequestId: 3,
    employeeId: 101,
    leaveType: 'Annual Leave',
    startDate: '2025-07-01',
    endDate: '2025-07-01',
    status: 'Rejected',
    approvedBy: 9001,
  ),
];