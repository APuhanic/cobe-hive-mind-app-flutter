import 'package:cobe_hive_mobile_app/app_colors.dart';
import 'package:cobe_hive_mobile_app/providers/leave_request_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateRequestButtons extends ConsumerWidget {
  const CreateRequestButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaveRequest = ref.watch(leaveRequestProvider);
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
                  builder: (BuildContext context) {
                    return const _RequestCreatedAlertDialog();
                  });
              ref
                  .read(leaveRequestListProvider.notifier)
                  .addLeaveRequest(leaveRequest);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: AppColors.textOrange,
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

class _RequestCreatedAlertDialog extends StatelessWidget {
  const _RequestCreatedAlertDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Center(child: Text('Request Created')),
        titleTextStyle: Theme.of(context).textTheme.bodyLarge,
        titlePadding: const EdgeInsets.only(top: 30),
        content: const Text(
          'Your request is created and it is currently being reviewed.',
          textAlign: TextAlign.center,
        ),
        contentTextStyle: Theme.of(context).textTheme.labelLarge,
        actions: [
          OutlinedButton(
            onPressed: () => Navigator.pushNamed(context, '/admin-home-screen'),
            style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.primary),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child: const Text(
              'Okay',
              style: TextStyle(
                color: AppColors.textOrange,
                fontSize: 16,
              ),
            ),
          ),
        ],
        actionsPadding: const EdgeInsets.only(bottom: 20),
        actionsAlignment: MainAxisAlignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ));
  }
}
