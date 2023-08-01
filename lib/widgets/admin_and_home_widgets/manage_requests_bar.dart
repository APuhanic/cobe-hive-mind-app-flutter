import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ManageRequestsBar extends StatelessWidget {
  const ManageRequestsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Manage Requests',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
            onPressed: () => Navigator.pushNamed(context, '/request-board'),
            child: const Text(
              'See all',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.textOrange,
              ),
            ))
      ],
    );
  }
}
