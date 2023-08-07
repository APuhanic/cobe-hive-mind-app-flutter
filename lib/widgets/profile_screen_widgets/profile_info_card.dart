import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/data/models/user.dart';
import 'package:cobe_hive_mobile_app/widgets/profile_screen_widgets/user_available_info.dart';
import 'package:cobe_hive_mobile_app/widgets/profile_screen_widgets/user_unavailable_info.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileInfoCard extends ConsumerWidget {
  final User user;
  const ProfileInfoCard(this.user, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        height: 170,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.widgetBackground,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 16.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              Text(
                '${user.name} ${user.surname}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              Text(
                'Role ・${user.role}',
                style: const TextStyle(
                  color: AppColors.textAccent,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 15),
              user.status == UserStatus.online
                  ? const UserAvailableInfo()
                  : const UserUnavailableInfo()
            ],
          ),
        ),
      ),
    );
  }
}
