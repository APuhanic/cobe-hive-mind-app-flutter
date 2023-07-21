import 'package:cobe_hive_mobile_app/app_colors.dart';
import 'package:cobe_hive_mobile_app/capitalize_string.dart';
import 'package:cobe_hive_mobile_app/leave_request.dart';
import 'package:cobe_hive_mobile_app/providers/leave_request_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RequestApprovalCard extends ConsumerWidget {
  const RequestApprovalCard({
    super.key,
    required this.leaveRequest,
  });

  final LeaveRequest leaveRequest;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date =
        '${leaveRequest.startDate.month}.${leaveRequest.startDate.day} - ${leaveRequest.endDate.month}.${leaveRequest.endDate.day + 10}';
    return Container(
        height: 165,
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
                  Image.asset(
                    'images/profile_pic.png',
                  ),
                  const Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.only(right: 14.0),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Reject',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  FilledButton(
                    onPressed: () {
                      ref
                          .read(leaveRequestListProvider.notifier)
                          .approveLeaveRequest(leaveRequest);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            'Approved',
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                            ),
                          ),
                          backgroundColor: AppColors.widgetBackground,
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {},
                          ),
                          behavior: SnackBarBehavior.floating,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(
                              color: AppColors.green,
                              width: 1,
                            ),
                          ),
                        ),
                      );
                    },
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: AppColors.textOrange,
                    ),
                    child: const Text(
                      'Approve',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
