import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:flutter/material.dart';

class EditProfileScreenHeader extends StatelessWidget {
  const EditProfileScreenHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.widgetBackground,
          ),
        ),
        Expanded(child: Container()),
        const Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(),
        ),
      ],
    );
  }
}
