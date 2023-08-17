import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/data/models/leave_request.dart';
import 'package:flutter/material.dart';

class LeaveReason extends StatelessWidget {
  const LeaveReason({
    super.key,
    required this.leaveRequest,
  });

  final LeaveRequest leaveRequest;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text('Reason'),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.gray,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: leaveRequest.reason == ''
                  ? const Text('No reason provided')
                  : Text(
                      leaveRequest.reason!,
                      style: const TextStyle(
                        fontSize: 17,
                        color: AppColors.text,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
