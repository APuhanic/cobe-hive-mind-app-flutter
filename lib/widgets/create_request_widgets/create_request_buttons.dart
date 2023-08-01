import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/providers/leave_request_providers/leave_request_options_provider.dart';
import 'package:cobe_hive_mobile_app/providers/leave_request_providers/leave_request_list_provider.dart';
import 'package:cobe_hive_mobile_app/widgets/create_request_widgets/request_created_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateRequestButtons extends ConsumerWidget {
  const CreateRequestButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaveRequest = ref.watch(leaveRequestOptionsProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 100,
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
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return const RequestCreatedAlertDialog();
                },
              );
              ref
                  .read(leaveRequestListProvider.notifier)
                  .addLeaveRequest(leaveRequest);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: AppColors.buttonOrange,
            ),
            child: const Text('Save', style: TextStyle(fontSize: 16)),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'Discard',
            style: TextStyle(
              color: AppColors.textOrange,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
