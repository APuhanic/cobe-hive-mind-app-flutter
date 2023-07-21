import 'package:cobe_hive_mobile_app/app_colors.dart';
import 'package:cobe_hive_mobile_app/providers/leave_request_provider.dart';
import 'package:cobe_hive_mobile_app/widgets/request_approval_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RequestApprovalList extends ConsumerWidget {
  const RequestApprovalList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaveRequestList = ref.watch(leaveRequestListPendingProvider);

    return leaveRequestList.isEmpty
        ? const _EmptyRequestListMessage()
        : Expanded(
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final leaveRequest = leaveRequestList[index];
                return RequestApprovalCard(leaveRequest: leaveRequest);
              },
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemCount: leaveRequestList.length,
            ),
          );
  }
}

class _EmptyRequestListMessage extends StatelessWidget {
  const _EmptyRequestListMessage();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 50, bottom: 8),
            child: Text(
              'No requests!',
              style: TextStyle(
                color: AppColors.text,
                fontSize: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 38.0),
            child: Text(
              'You can take a time off.',
              style: TextStyle(
                color: AppColors.textAccent,
                fontSize: 20,
              ),
            ),
          ),
          Image.asset(
            'images/chilling.png',
            opacity: const AlwaysStoppedAnimation(.5),
          ),
        ],
      ),
    );
  }
}
