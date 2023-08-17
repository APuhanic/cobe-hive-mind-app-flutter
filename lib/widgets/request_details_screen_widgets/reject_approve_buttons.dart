import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/data/models/leave_request.dart';
import 'package:cobe_hive_mobile_app/providers/create_request_screen_providers/selected_request_provider.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/absence_controller_provider.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/absence_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RejectApproveButtons extends ConsumerWidget {
  const RejectApproveButtons({
    super.key,
    required this.leaveRequest,
  });

  final LeaveRequest leaveRequest;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isApproved = leaveRequest.isApproved == true;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: leaveRequest.isApproved == true
              ? null
              : () {
                  //promjena u listi u provideru
                  ref
                      .read(absenceListProvider.notifier)
                      .rejectAbsence(leaveRequest.id!);
                  ref.read(absenceListProvider.notifier).getAbsences();
                  Navigator.pop(context);
                },
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
            onPressed: leaveRequest.isApproved == true
                ? null
                : () {
                    //promjena u listi u provideru
                    ref
                        .read(absenceControllerProvider.notifier)
                        .approveAbsence(leaveRequest);
                    //promjena u odabranom requestu u provideru za ovaj screen
                    ref.read(selectedLeaveRequestProvider.notifier).state =
                        leaveRequest.copyWith(isApproved: true);
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
