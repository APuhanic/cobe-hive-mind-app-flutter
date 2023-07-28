import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:cobe_hive_mobile_app/data/app_colors.dart';

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
      spaceBetweenChildren: 20,
      childrenButtonSize: const Size(236, 46),
      childPadding: const EdgeInsets.only(right: 90),
      children: [
        SpeedDialChild(
          width: 240,
          height: 40,
          blurRadius: 28,
          shadowColor: AppColors.orangeShadow,
          backgroundColor: AppColors.primary,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Create Request',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onTap: () => Navigator.of(context).pushNamed('/create-request'),
        ),
        SpeedDialChild(
          width: 220,
          height: 40,
          blurRadius: 28,
          shadowColor: AppColors.orangeShadow,
          backgroundColor: AppColors.primary,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Add Absence',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
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
