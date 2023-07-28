import 'package:cobe_hive_mobile_app/data/app_colors.dart';
import 'package:flutter/material.dart';

class PendingChip extends StatelessWidget {
  const PendingChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.warning,
        boxShadow: const [
          BoxShadow(
            color: AppColors.warningShadow,
            blurRadius: 11,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Pending',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
