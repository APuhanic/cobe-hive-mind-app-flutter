import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/absence_list_provider.dart';
import 'package:cobe_hive_mobile_app/widgets/leave_request_status_card/leave_request_status_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ApprovedRequestList extends ConsumerWidget {
  const ApprovedRequestList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final absenceList = ref.watch(absenceListApprovedProvider);

    return absenceList.isEmpty
        ? const _NoApprovedRequests()
        : ListView.separated(
            itemCount: absenceList.length,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(vertical: 18),
            separatorBuilder: (context, index) => const SizedBox(height: 18),
            itemBuilder: (context, index) =>
                LeaveRequestStatusCard(leaveRequest: absenceList[index]),
          );
  }
}

class _NoApprovedRequests extends StatelessWidget {
  const _NoApprovedRequests();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No pending requests',
        style: TextStyle(
          color: AppColors.text,
          fontSize: 20,
        ),
      ),
    );
  }
}
