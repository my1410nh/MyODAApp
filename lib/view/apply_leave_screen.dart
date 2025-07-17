import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/leave_form_controller.dart';
import '../model/leave_model.dart';
import '../model/leave_history_data.dart';

class ApplyLeaveScreen extends StatelessWidget {
  const ApplyLeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LeaveFormController>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Apply Leave', style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Leave Type:', style: TextStyle(fontFamily: 'Poppins')),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              value: controller.selectedLeaveType,
              items: const [
                DropdownMenuItem(value: 'Annual', child: Text('Annual')),
                DropdownMenuItem(value: 'Sick', child: Text('Sick')),
                DropdownMenuItem(value: 'Emergency', child: Text('Emergency')),
              ],
              onChanged: (value) {
                controller.selectedLeaveType = value;
                controller.notifyListeners();
              },
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            const Text('Select Date:', style: TextStyle(fontFamily: 'Poppins')),
            const SizedBox(height: 6),
            TextField(
              readOnly: true,
              decoration: const InputDecoration(
                hintText: 'Select leave date...',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () async {
                final picked = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  controller.selectedStartDate = picked.start;
                  controller.selectedEndDate = picked.end;
                  controller.notifyListeners();
                }
              },
            ),
            const SizedBox(height: 12),
            const Text('Select Period:', style: TextStyle(fontFamily: 'Poppins')),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              value: controller.leavePeriod,
              items: const [
                DropdownMenuItem(value: 'Full Day', child: Text('Full Day')),
                DropdownMenuItem(value: 'Morning', child: Text('Morning')),
                DropdownMenuItem(value: 'Afternoon', child: Text('Afternoon')),
              ],
              onChanged: (value) {
                controller.leavePeriod = value!;
                controller.notifyListeners();
              },
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            const Text('Reason:', style: TextStyle(fontFamily: 'Poppins')),
            const SizedBox(height: 6),
            TextField(
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Enter reason...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                controller.reason = value;
                controller.notifyListeners();
              },
            ),
            const SizedBox(height: 12),
            const Text('Jobs Will Be Covered By:', style: TextStyle(fontFamily: 'Poppins')),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              value: controller.coveredBy,
              items: const [
                DropdownMenuItem(value: 'John Doe', child: Text('John Doe')),
                DropdownMenuItem(value: 'Jane Smith', child: Text('Jane Smith')),
              ],
              onChanged: (value) {
                controller.coveredBy = value!;
                controller.notifyListeners();
              },
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (controller.selectedLeaveType != null &&
                    controller.selectedStartDate != null &&
                    controller.selectedEndDate != null) {
                  mockLeaveHistory.add(
                    LeaveRequestModel(
                      employeeId: 1,
                      leaveType: controller.selectedLeaveType!,
                      startDate: controller.selectedStartDate!.toString().split(' ')[0],
                      endDate: controller.selectedEndDate!.toString().split(' ')[0],
                      status: 'Pending',
                      approvedBy: null,
                    ),
                  );
                  controller.reset();
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00C2CB),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Center(
                child: Text('Apply Leave', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
