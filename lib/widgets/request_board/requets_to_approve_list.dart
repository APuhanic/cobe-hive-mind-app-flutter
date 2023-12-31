import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/absence_list_provider.dart';
import 'package:cobe_hive_mobile_app/widgets/request_board/request_to_approve_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RequestsToApproveList extends ConsumerWidget {
  const RequestsToApproveList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final absenceList = ref.watch(absenceListPendingProvider);

    return absenceList.isEmpty
        ? const _EmptyRequestListMessage()
        : Expanded(
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemCount: absenceList.length,
              itemBuilder: (context, index) =>
                  RequestToApproveCard(leaveRequest: absenceList[index]),
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
