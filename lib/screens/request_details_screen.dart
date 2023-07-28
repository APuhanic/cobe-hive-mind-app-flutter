import 'package:cobe_hive_mobile_app/data/app_colors.dart';
import 'package:cobe_hive_mobile_app/providers/leave_request_provider.dart';
import 'package:cobe_hive_mobile_app/providers/selected_request_provider.dart';
import 'package:cobe_hive_mobile_app/widgets/request_details_status_card.dart';
import 'package:flutter/material.dart';

import 'package:cobe_hive_mobile_app/data/leave_request.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RequestDetailsScreen extends ConsumerWidget {
  const RequestDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLeaveRequest = ref.watch(selectedLeaveRequestProvider);
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: RequestDetailsStatusCard(),
            ),
            const _LeaveDate(),
            _LeaveReason(leaveRequest: selectedLeaveRequest),
            Expanded(child: Container()),
            _RejectApproveButtons(leaveRequest: selectedLeaveRequest),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class _RejectApproveButtons extends ConsumerWidget {
  const _RejectApproveButtons({
    required this.leaveRequest,
  });

  final LeaveRequest leaveRequest;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isApproved = leaveRequest.status == RequestStatus.approved;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed:
              leaveRequest.status == RequestStatus.approved ? null : () {},
          child: Text(
            'Reject',
            style: TextStyle(
              fontSize: 17,
              color: isApproved
                  ? AppColors.primary.withOpacity(0.65)
                  : AppColors.primary,
            ),
          ),
        ),
        const SizedBox(width: 50),
        Container(
          width: 110,
          decoration: BoxDecoration(
            boxShadow: [
              isApproved
                  ? const BoxShadow(color: Colors.transparent)
                  : const BoxShadow(
                      color: AppColors.orangeShadow,
                      blurRadius: 11,
                      offset: Offset(0, 5),
                    ),
            ],
          ),
          child: ElevatedButton(
            onPressed: leaveRequest.status == RequestStatus.approved
                ? null
                : () {
                    //promjena u listi u provideru
                    ref
                        .read(leaveRequestListProvider.notifier)
                        .approveLeaveRequest(leaveRequest);
                    //promjena u odabranom requestu u provideru za ovaj screen
                    ref.read(selectedLeaveRequestProvider.notifier).state =
                        leaveRequest.copyWith(status: RequestStatus.approved);
                  },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: AppColors.primary,
              disabledBackgroundColor: AppColors.primary.withOpacity(0.65),
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
              child: leaveRequest.reason == ''
                  ? const Text('No reason provided')
                  : Text(
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
