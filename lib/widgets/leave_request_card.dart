import 'package:cobe_hive_mobile_app/app_colors.dart';
import 'package:cobe_hive_mobile_app/capitalize_string.dart';
import 'package:cobe_hive_mobile_app/leave_request.dart';
import 'package:cobe_hive_mobile_app/widgets/pending_chip.dart';
import 'package:flutter/material.dart';

class LeaveRequestCard extends StatelessWidget {
  const LeaveRequestCard({
    super.key,
    required this.leaveRequest,
  });

  final LeaveRequest leaveRequest;

  @override
  Widget build(BuildContext context) {
    final date =
        '${leaveRequest.startDate.month}.${leaveRequest.startDate.day} - ${leaveRequest.endDate.month}.${leaveRequest.endDate.day + 10}';
    return Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.widgetBackground,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                leaveRequest.leaveType.name.capitalize(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.text,
                ),
              ),
              Text(
                '${leaveRequest.endDate.day + 10} days・ $date ${leaveRequest.startDate.year}',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.textAccent,
                ),
              ),
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const PendingChip(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.buttonSecond,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_rounded,
                        color: AppColors.text,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
