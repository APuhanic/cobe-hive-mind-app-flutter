import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:flutter/material.dart';

class PublicProfileScreenHeader extends StatelessWidget {
  const PublicProfileScreenHeader({
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
      ],
    );
  }
}
