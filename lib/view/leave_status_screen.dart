import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/leave_model.dart';
import '../model/leave_history_data.dart';
import '../model/leave_form_controller.dart';
import 'apply_leave_screen.dart';

class LeaveStatusScreen extends StatelessWidget {
  const LeaveStatusScreen({super.key});

  Color getStatusColor(String status) {
    switch (status) {
      case 'Approved':
        return Colors.green;
      case 'Rejected':
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leave Status', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: const Color(0xFFF8F8F8),
      body: ListView.builder(
        itemCount: mockLeaveHistory.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final leave = mockLeaveHistory[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(leave.leaveType, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('${leave.startDate} - ${leave.endDate}'),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: getStatusColor(leave.status).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    leave.status,
                    style: TextStyle(
                      color: getStatusColor(leave.status),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF00C2CB),
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChangeNotifierProvider(
                create: (_) => LeaveFormController(),
                child: const ApplyLeaveScreen(),
              ),
            ),
          );
        },
      ),
    );
  }
}
