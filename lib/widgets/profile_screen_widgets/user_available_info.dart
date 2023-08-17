import 'package:cobe_hive_mobile_app/widgets/leave_request_status_card/online_chip.dart';
import 'package:flutter/material.dart';

import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';

class UserAvailableInfo extends StatelessWidget {
  const UserAvailableInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OnlineChip(),
        SizedBox(width: 18),
        Text(
          'Available',
          style: TextStyle(
            color: AppColors.textAccent,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
