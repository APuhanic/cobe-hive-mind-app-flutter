import 'package:cobe_hive_mobile_app/widgets/leave_request_status_card/offline_chip.dart';
import 'package:flutter/material.dart';

import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';

class UserUnavailableInfo extends StatelessWidget {
  const UserUnavailableInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OfflineChip(),
        SizedBox(width: 24),
        Text(
          'Unavailable',
          style: TextStyle(
            color: AppColors.textAccent,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
