import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RequestCreatedAlertDialog extends StatelessWidget {
  const RequestCreatedAlertDialog({super.key});

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
            onPressed: () {
              int count = 0;
              Navigator.of(context).popUntil((_) => count++ >= 2);
            },
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
