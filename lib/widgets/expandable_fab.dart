import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:cobe_hive_mobile_app/app_colors.dart';

class ExpandableFAB extends StatelessWidget {
  const ExpandableFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: AppColors.primary,
      icon: Icons.add,
      activeIcon: Icons.close,
      foregroundColor: Colors.white,
      activeBackgroundColor: AppColors.primary,
      activeForegroundColor: Colors.white,
      overlayColor: AppColors.overlayShadow,
      overlayOpacity: 0.5,
      spaceBetweenChildren: 15,
      childrenButtonSize: const Size(236, 46),
      childPadding: const EdgeInsets.only(right: 90),
      children: [
        SpeedDialChild(
          backgroundColor: AppColors.primary,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Create Request',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SpeedDialChild(
          backgroundColor: AppColors.primary,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Add Absence',
              style: TextStyle(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          onTap: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
