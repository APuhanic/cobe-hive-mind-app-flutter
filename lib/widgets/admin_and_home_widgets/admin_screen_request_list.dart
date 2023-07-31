import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/providers/leave_request_providers/leave_request_list_provider.dart';
import 'package:cobe_hive_mobile_app/widgets/leave_request_status_card/leave_request_status_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AdminScreenRequestList extends ConsumerWidget {
  const AdminScreenRequestList({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaveRequestList = ref.watch(leaveRequestListPendingProvider);
    return leaveRequestList.isEmpty
        ? const Center(
            child: Text(
              'No pending requests',
              style: TextStyle(
                color: AppColors.text,
                fontSize: 20,
              ),
            ),
          )
        : ListView.separated(
            itemCount: leaveRequestList.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            separatorBuilder: (context, index) => const SizedBox(
              width: 18,
            ),
            itemBuilder: (context, index) {
              final request = leaveRequestList[index];
              return LeaveRequestStatusCard(
                leaveRequest: request,
              );
            },
          );
  }
}
