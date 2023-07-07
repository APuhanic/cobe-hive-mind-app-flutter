import 'package:cobe_hive_mobile_app/app_colors.dart';
import 'package:flutter/material.dart';

class CobeSearchBar extends StatelessWidget {
  const CobeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: AppColors.widgetBackground,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            offset: Offset(0, 2),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          labelText: 'Search...',
          labelStyle: TextStyle(
            color: AppColors.accent,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.accent,
          ),
          border: InputBorder.none,
          iconColor: AppColors.accent,
        ),
      ),
    );
  }
}
