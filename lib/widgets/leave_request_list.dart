import 'package:cobe_hive_mobile_app/providers/leave_request_provider.dart';
import 'package:cobe_hive_mobile_app/widgets/leave_request_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LeaveRequestList extends ConsumerWidget {
  const LeaveRequestList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaveRequestList = ref.watch(leaveRequestListProvider);
    return ListView.separated(
      itemCount: leaveRequestList.length,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      separatorBuilder: (context, index) => const SizedBox(
        width: 18,
      ),
      itemBuilder: (context, index) {
        final request = leaveRequestList[index];
        return LeaveRequestCard(leaveRequest: request);
      },
    );
  }
}
