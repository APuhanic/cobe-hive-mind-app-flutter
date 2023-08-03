import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/capitalize_string.dart';
import 'package:cobe_hive_mobile_app/data/models/leave_request.dart';
import 'package:cobe_hive_mobile_app/providers/create_request_screen_providers/selected_request_provider.dart';
import 'package:cobe_hive_mobile_app/widgets/leave_request_status_card/approved_chip.dart';
import 'package:cobe_hive_mobile_app/widgets/leave_request_status_card/pending_chip.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RequestDetailsStatusCard extends ConsumerWidget {
  const RequestDetailsStatusCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaveRequest = ref.watch(selectedLeaveRequestProvider);
    final date =
        '${leaveRequest.startDate.month}.${leaveRequest.startDate.day} - ${leaveRequest.endDate.month}.${leaveRequest.endDate.day + 10}';
    return Container(
      height: 150,
      width: double.infinity,
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
                leaveRequest.status == RequestStatus.pending
                    ? const PendingChip()
                    : const ApprovedChip(),
              ],
            )
          ],
        ),
      ),
    );
  }
}