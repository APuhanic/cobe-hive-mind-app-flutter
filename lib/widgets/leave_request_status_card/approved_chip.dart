import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ApprovedChip extends StatelessWidget {
  const ApprovedChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.green,
        boxShadow: const [
          BoxShadow(
            color: AppColors.greenShadow,
            blurRadius: 11,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Approved',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
