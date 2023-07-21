import 'package:cobe_hive_mobile_app/app_colors.dart';
import 'package:cobe_hive_mobile_app/leave_request.dart';
import 'package:cobe_hive_mobile_app/widgets/leave_request_status_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LeaveRequestStatusList extends ConsumerWidget {
  const LeaveRequestStatusList({
    super.key,
    this.axis = Axis.horizontal,
    required this.leaveRequestList,
  });
  final Axis axis;
  final List<LeaveRequest> leaveRequestList;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            scrollDirection: axis,
            padding: axis == Axis.horizontal
                ? const EdgeInsets.symmetric(horizontal: 18)
                : const EdgeInsets.symmetric(vertical: 18),
            separatorBuilder: (context, index) => SizedBox(
              width: axis == Axis.horizontal ? 18 : 0,
              height: axis == Axis.vertical ? 18 : 0,
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
