import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:flutter/material.dart';

class OfflineChip extends StatelessWidget {
  const OfflineChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.widgetBackground,
        border: Border.all(
          color: AppColors.accent,
          width: 1,
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
        child: Text(
          'Offline',
          style: TextStyle(
            color: AppColors.textAccent,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
