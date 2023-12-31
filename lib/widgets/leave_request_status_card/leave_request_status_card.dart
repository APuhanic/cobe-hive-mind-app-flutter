import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/capitalize_string.dart';
import 'package:cobe_hive_mobile_app/data/models/leave_request.dart';
import 'package:cobe_hive_mobile_app/providers/create_request_screen_providers/selected_request_provider.dart';
import 'package:cobe_hive_mobile_app/widgets/leave_request_status_card/approved_chip.dart';
import 'package:cobe_hive_mobile_app/widgets/leave_request_status_card/pending_chip.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LeaveRequestStatusCard extends ConsumerWidget {
  const LeaveRequestStatusCard({
    super.key,
    required this.leaveRequest,
    this.width = 300,
  });
  final LeaveRequest leaveRequest;
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 150,
      width: width,
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
              leaveRequest.leaveType!.name.capitalize(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.text,
              ),
            ),
            Text(
              '${leaveRequest.getDuration()} days・ ${leaveRequest.getStartMonth()} ${leaveRequest.startDate?.day} - ${leaveRequest.getEndMonth()} ${leaveRequest.endDate?.day}, ${leaveRequest.startDate?.year}',
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
                leaveRequest.isApproved == false
                    ? const PendingChip()
                    : const ApprovedChip(),
                _RequestDetailsButton(leaveRequest: leaveRequest)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _RequestDetailsButton extends ConsumerWidget {
  const _RequestDetailsButton({
    required this.leaveRequest,
  });

  final LeaveRequest leaveRequest;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.buttonSecond,
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/request-details');
          ref.watch(selectedLeaveRequestProvider.notifier).state = leaveRequest;
        },
        icon: const Icon(
          Icons.arrow_forward_rounded,
          color: AppColors.text,
        ),
      ),
    );
  }
}
