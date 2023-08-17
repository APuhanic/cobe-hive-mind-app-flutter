import 'package:cobe_hive_mobile_app/providers/network_providers/absence_list_provider.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/logged_in_user_provider.dart';
import 'package:cobe_hive_mobile_app/widgets/leave_request_status_card/leave_request_status_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PrivateAbsenceList extends ConsumerWidget {
  const PrivateAbsenceList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAbsenceList = ref
        .watch(absenceListByUserProvider(ref.read(loggedInUserProvider)!.id));

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: userAbsenceList.isEmpty
            ? const Text('No requests!')
            : ListView.separated(
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemCount: userAbsenceList.length,
                itemBuilder: (context, index) => LeaveRequestStatusCard(
                    leaveRequest: userAbsenceList[index]),
              ),
      ),
    );
  }
}
