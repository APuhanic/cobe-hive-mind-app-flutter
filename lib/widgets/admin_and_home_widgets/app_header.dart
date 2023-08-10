import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:cobe_hive_mobile_app/data/constants/endpoints.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/logged_in_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppHeader extends ConsumerWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(loggedInUserProvider);
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
      child: Row(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.of(context).pushNamed('/private-profile-screen'),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                '${Endpoints.baseUrl}${user!.imageUrl}',
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            'Home',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Expanded(child: Container()),
          const _CalendarIcon(),
          const SizedBox(width: 15),
          const _BellIcon(),
        ],
      ),
    );
  }
}

class _BellIcon extends StatelessWidget {
  const _BellIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.widgetBackground,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            offset: Offset(0, 2),
            blurRadius: 15.0,
          ),
        ],
      ),
      child: IconButton(
        onPressed: () {},
        style: IconButton.styleFrom(
          shape: const CircleBorder(),
          elevation: 8,
          backgroundColor: AppColors.widgetBackground,
        ),
        icon: const Icon(Icons.notifications_outlined),
        iconSize: 30,
      ),
    );
  }
}

class _CalendarIcon extends StatelessWidget {
  const _CalendarIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.widgetBackground,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            offset: Offset(0, 2),
            blurRadius: 15.0,
          ),
        ],
      ),
      child: IconButton(
        onPressed: () {},
        style: IconButton.styleFrom(
          shape: const CircleBorder(),
          elevation: 20,
          backgroundColor: AppColors.widgetBackground,
        ),
        icon: const Icon(Icons.calendar_month_outlined),
        iconSize: 30,
      ),
    );
  }
}
