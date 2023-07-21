import 'package:cobe_hive_mobile_app/app_colors.dart';
import 'package:cobe_hive_mobile_app/providers/leave_request_provider.dart';
import 'package:cobe_hive_mobile_app/widgets/leave_request_status_card.dart';
import 'package:flutter/material.dart';

import 'package:cobe_hive_mobile_app/leave_request.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RequestDetailsScreen extends ConsumerWidget {
  const RequestDetailsScreen({super.key, required this.leaveRequest});

  final LeaveRequest leaveRequest;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 40),
              child: _RequestDetailsHeader(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/ronalds.png',
                ),
                const SizedBox(width: 15),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ronald Richards',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Software Engineer',
                      style: TextStyle(
                        fontSize: 17,
                        color: AppColors.accent,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: LeaveRequestStatusCard(
                leaveRequest: leaveRequest,
                width: double.infinity,
              ),
            ),
            const _LeaveDate(),
            _LeaveReason(leaveRequest: leaveRequest),
            Expanded(
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Reject',
                    style: TextStyle(
                      fontSize: 17,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 50),
                Container(
                  width: 110,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.orangeShadow,
                        blurRadius: 11,
                        offset: Offset(0, 5),
                      )
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      ref
                          .read(leaveRequestListProvider.notifier)
                          .approveLeaveRequest(leaveRequest);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: const Color.fromRGBO(252, 68, 2, 1),
                    ),
                    child: const Text(
                      'Approve',
                      style: TextStyle(
                        fontSize: 17,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class _LeaveReason extends StatelessWidget {
  const _LeaveReason({
    required this.leaveRequest,
  });

  final LeaveRequest leaveRequest;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text('Reason'),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.gray,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Text(
                leaveRequest.reason,
                style: const TextStyle(
                  fontSize: 17,
                  color: AppColors.text,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LeaveDate extends StatelessWidget {
  const _LeaveDate();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'FROM',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Text(
                'TO',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(width: 20),
          Column(
            children: [
              Text(
                'Friday 14 October 2022 ・08:00',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.textAccent,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Friday 14 October 2022 ・08:00',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.textAccent,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _RequestDetailsHeader extends StatelessWidget {
  const _RequestDetailsHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        Expanded(
          child: Container(),
        ),
        Text(
          'Request Details',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Expanded(
          flex: 2,
          child: Container(),
        ),
      ],
    );
  }
}
