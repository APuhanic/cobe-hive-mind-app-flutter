import 'package:cobe_hive_mobile_app/data/app_colors.dart';
import 'package:cobe_hive_mobile_app/providers/user_search_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CobeSearchBar extends ConsumerWidget {
  const CobeSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchFilter = ref.watch(userSearchProvider.notifier);

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
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(
            color: AppColors.textAccent,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.accent,
          ),
          border: InputBorder.none,
          iconColor: AppColors.accent,
        ),
        onChanged: (value) => searchFilter.state = value,
      ),
    );
  }
}
