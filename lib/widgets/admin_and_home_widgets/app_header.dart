import 'package:cobe_hive_mobile_app/data/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
      child: Row(
        children: [
          Image.asset(
            'images/profile_pic.png',
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
