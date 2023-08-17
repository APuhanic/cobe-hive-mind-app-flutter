import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/data/constants/endpoints.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/user_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserDetails extends ConsumerWidget {
  const UserDetails(
    this.userId, {
    super.key,
  });

  final String? userId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider(userId!));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              '${Endpoints.baseUrl}${user!.imageUrl}',
            ),
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.name} ${user.surname}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${user.role}',
              style: const TextStyle(
                fontSize: 17,
                color: AppColors.accent,
              ),
            ),
          ],
        )
      ],
    );
  }
}
