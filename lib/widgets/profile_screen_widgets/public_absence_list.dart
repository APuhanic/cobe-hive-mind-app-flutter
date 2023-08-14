import 'package:cobe_hive_mobile_app/providers/network_providers/absence_list_provider.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/selected_user_provider.dart';
import 'package:cobe_hive_mobile_app/widgets/leave_request_status_card/leave_request_status_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PublicAbsenceList extends ConsumerWidget {
  const PublicAbsenceList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final publicUserAbsenceList = ref
        .watch(absenceListByUserProvider(ref.watch(selectedUserProvider).id));
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: publicUserAbsenceList.isEmpty
            ? const Text('No requests!')
            : ListView.separated(
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemCount: publicUserAbsenceList.length,
                itemBuilder: (context, index) => LeaveRequestStatusCard(
                    leaveRequest: publicUserAbsenceList[index]),
              ),
      ),
    );
  }
}
